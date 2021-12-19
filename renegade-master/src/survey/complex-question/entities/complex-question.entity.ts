import { Survey } from 'src/survey/entities/survey.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Option } from '../option/entities/option.entity';

@Entity()
export class ComplexQuestion {
  @PrimaryGeneratedColumn()
  complex_question_id: number;

  @Column({
    type: 'varchar',
    unique: true,
    length: 128,
  })
  key: string;

  @Column({
    type: 'varchar',
    length: 2500,
  })
  question: string;

  @ManyToOne(() => Survey, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  survey: Survey;

  @CreateDateColumn()
  created_at: Date;
}
