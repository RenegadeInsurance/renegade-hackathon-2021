import { Module } from '@nestjs/common';
import { SurveyService } from './survey.service';
import { SurveyController } from './survey.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Survey } from './entities/survey.entity';
import { ComplexQuestionModule } from './complex-question/complex-question.module';

@Module({
  imports: [TypeOrmModule.forFeature([Survey]), ComplexQuestionModule],
  controllers: [SurveyController],
  providers: [SurveyService],
})
export class SurveyModule {}
