import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Survey {
  @PrimaryGeneratedColumn()
  survey_id: number;

  @Column({
    type: 'varchar',
    length: 250,
  })
  name: string;

  @Column({
    type: 'varchar',
    length: 2500,
  })
  description: string;
}
