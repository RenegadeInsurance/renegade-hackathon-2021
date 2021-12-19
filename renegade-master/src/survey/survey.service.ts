import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectConnection, InjectRepository } from '@nestjs/typeorm';
import { Connection, Repository } from 'typeorm';
import { ComplexQuestionService } from './complex-question/complex-question.service';
import { CreateSurveyDto } from './dto/create-survey.dto';
import { Survey } from './entities/survey.entity';

@Injectable()
export class SurveyService {
  constructor(
    @InjectRepository(Survey)
    private readonly surveyRepository: Repository<Survey>,
    @InjectConnection()
    private readonly connection: Connection,
    private readonly complexQuestionService: ComplexQuestionService,
  ) {}

  async create(createSurveyDto: CreateSurveyDto) {
    const queryRunner = await this.connection.createQueryRunner();
    await queryRunner.connect();
    await queryRunner.startTransaction('READ COMMITTED');
    try {
      const survey_ = await queryRunner.manager.create(Survey, {
        ...createSurveyDto,
      });
      const survey = await queryRunner.manager.save(survey_);
      const savedQuestions =
        await this.complexQuestionService.createQuestionBFS(
          createSurveyDto.questions,
          survey,
          queryRunner,
        );
      await Promise.all(
        createSurveyDto.questions.map(async (question, index) => {
          await this.complexQuestionService.createQuestionOption(
            question,
            savedQuestions[index],
            queryRunner,
          );
        }),
      );
      await queryRunner.commitTransaction();
      return survey;
    } catch (e) {
      await queryRunner.rollbackTransaction();
      throw e;
    } finally {
      await queryRunner.release();
    }
  }

  async findAll(take: number, skip: number) {
    return this.surveyRepository.find({
      take,
      skip,
    });
  }

  async findOne(id: number, throwError = true) {
    const survey = await this.surveyRepository
      .createQueryBuilder('survey')
      .where(`"survey"."survey_id" = :id`, { id })
      .getOne();

    if (!survey && throwError) throw new NotFoundException('Survey not found');

    survey['question'] = await this.complexQuestionService.getEntryNode(
      survey.survey_id,
    );
    return survey;
  }
}
