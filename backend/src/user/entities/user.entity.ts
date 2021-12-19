import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    type: 'varchar',
    length: 250,
  })
  name: string;

  @Column({
    type: 'varchar',
    length: 250,
  })
  phone: string;

  @Column({
    type: 'varchar',
    length: 250,
  })
  email: string;

  @Column({
    type: 'float4',
  })
  threshold: number;
}
