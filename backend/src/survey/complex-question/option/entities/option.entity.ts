import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { ComplexQuestion } from '../../entities/complex-question.entity';

@Entity()
export class Option {
  @PrimaryGeneratedColumn()
  option_id: number;

  @Column({
    type: 'varchar',
  })
  option: string;

  @ManyToOne(() => ComplexQuestion, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  question: ComplexQuestion;

  @OneToOne(() => ComplexQuestion, {
    onDelete: 'CASCADE',
    nullable: true,
  })
  @JoinColumn()
  follow_question: ComplexQuestion;

  @Column({
    type: 'varchar',
    nullable: true,
  })
  result: string;
}
