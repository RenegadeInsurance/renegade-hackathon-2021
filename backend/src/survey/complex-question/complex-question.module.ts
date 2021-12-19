import { forwardRef, Module } from '@nestjs/common';
import { ComplexQuestionService } from './complex-question.service';
import { ComplexQuestionController } from './complex-question.controller';
import { OptionModule } from './option/option.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ComplexQuestion } from './entities/complex-question.entity';

@Module({
  imports: [
    forwardRef(() => OptionModule),
    TypeOrmModule.forFeature([ComplexQuestion]),
  ],
  controllers: [ComplexQuestionController],
  providers: [ComplexQuestionService],
  exports: [ComplexQuestionService],
})
export class ComplexQuestionModule {}
