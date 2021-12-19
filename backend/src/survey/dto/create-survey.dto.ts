import { IsNumber, IsString } from 'class-validator';

export class CreateSurveyDto {
  @IsString()
  name: string;

  @IsString()
  description: string;

  @IsNumber()
  survey: number;

  questions: SurveyQuestionInterface[];
}
