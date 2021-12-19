import { forwardRef, Module } from '@nestjs/common';
import { OptionService } from './option.service';
import { OptionController } from './option.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Option } from './entities/option.entity';
import { ComplexQuestionModule } from '../complex-question.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Option]),
    forwardRef(() => ComplexQuestionModule),
  ],
  controllers: [OptionController],
  providers: [OptionService],
  exports: [OptionService],
})
export class OptionModule {}
