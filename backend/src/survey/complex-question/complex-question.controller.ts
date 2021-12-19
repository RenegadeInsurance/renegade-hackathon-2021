import { Controller, Get, Param, ParseIntPipe } from '@nestjs/common';
import { ComplexQuestionService } from './complex-question.service';
import { ComplexQuestion } from './entities/complex-question.entity';

@Controller('complex-question')
export class ComplexQuestionController {
  constructor(
    private readonly complexQuestionService: ComplexQuestionService,
  ) {}

  @Get('/question/:id')
  async getNextNode(
    @Param('id', ParseIntPipe) id: number,
  ): Promise<ComplexQuestion> {
    return this.complexQuestionService.getNextNode(id);
  }
}
