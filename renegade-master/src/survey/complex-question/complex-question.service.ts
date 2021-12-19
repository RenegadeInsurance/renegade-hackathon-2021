import {
  forwardRef,
  Inject,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { QueryRunner, Repository } from 'typeorm';
import { Survey } from '../entities/survey.entity';
import { ComplexQuestion } from './entities/complex-question.entity';
import { OptionService } from './option/option.service';

@Injectable()
export class ComplexQuestionService {
  constructor(
    @InjectRepository(ComplexQuestion)
    private readonly complexQuestionRepository: Repository<ComplexQuestion>,
    @Inject(forwardRef(() => OptionService))
    private readonly optionService: OptionService,
  ) {}

  async getEntryNode(survey: number): Promise<ComplexQuestion> {
    const question = await this.complexQuestionRepository.findOne({
      where: { survey },
      order: {
        created_at: 'ASC',
      },
    });
    question['options'] = await this.optionService.getOptionForQuestion(
      question.complex_question_id,
    );
    return question;
  }

  async findOne(key: string, throwError = true): Promise<ComplexQuestion> {
    const complex = await this.complexQuestionRepository.findOne({
      where: { key },
    });
    if (!complex && throwError)
      throw new NotFoundException('Complex Question not found');
    return complex;
  }

  async createComplexQuestion(args: {
    question: string;
    survey: Survey;
  }): Promise<ComplexQuestion> {
    const complexQuestion = this.complexQuestionRepository.create({
      question: args.question,
      survey: args.survey,
    });
    return this.complexQuestionRepository.save(complexQuestion);
  }

  async getNextNode(id: number): Promise<ComplexQuestion> {
    const question = await this.complexQuestionRepository.findOne({
      complex_question_id: id,
    });
    question['options'] = await this.optionService.getOptionForQuestion(
      question.complex_question_id,
    );
    return question;
  }

  async createQuestionOption(
    questionRaw: SurveyQuestionInterface,
    savedQuestion: ComplexQuestion,
    queryRunner,
  ): Promise<ComplexQuestion> {
    await Promise.all(
      questionRaw.options.map(async ({ body, follow_question, result }) => {
        return await this.optionService.create({
          option: body,
          question: savedQuestion,
          follow_question,
          result,
          queryRunner,
        });
      }),
    );
    return savedQuestion;
  }

  async createQuestionBFS(
    questions: SurveyQuestionInterface[],
    survey: Survey,
    queryRunner: QueryRunner,
  ): Promise<ComplexQuestion[]> {
    const questionsCreated = questions.map((question) =>
      queryRunner.manager.create(ComplexQuestion, {
        question: question.question,
        survey,
        key: question.uuid,
      }),
    );
    return await queryRunner.manager.save(questionsCreated);
  }
}
