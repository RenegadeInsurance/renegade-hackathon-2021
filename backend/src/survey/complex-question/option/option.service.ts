import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, QueryRunner } from 'typeorm';
import { ComplexQuestionService } from '../complex-question.service';
import { ComplexQuestion } from '../entities/complex-question.entity';
import { Option } from './entities/option.entity';

@Injectable()
export class OptionService {
  constructor(
    @InjectRepository(Option)
    private readonly optionRepository: Repository<Option>,
    @Inject(forwardRef(() => ComplexQuestionService))
    private readonly complexQuestionService: ComplexQuestionService,
  ) {}

  async getOptionForQuestion(id: number) {
    return this.optionRepository.find({
      where: {
        question: id,
      },
      select: ['result', 'follow_question', 'option'],
      loadRelationIds: true,
    });
  }

  async create({
    option,
    question,
    follow_question,
    result,
    queryRunner,
  }: {
    queryRunner: QueryRunner;
    option: string;
    question: ComplexQuestion;
    follow_question: string;
    result: string | null;
  }): Promise<Option> {
    let followQuestion = follow_question
      ? await queryRunner.manager.findOne(ComplexQuestion, {
          where: { key: follow_question },
        })
      : null;

    const option_ = queryRunner.manager.create(Option, {
      option,
      follow_question: followQuestion,
      question,
      result,
    });
    return queryRunner.manager.save(option_);
  }
}
