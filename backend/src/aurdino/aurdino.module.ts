import { Module } from '@nestjs/common';
import { AurdinoGateway } from './aurdino.gateway';

@Module({
  providers: [AurdinoGateway]
})
export class AurdinoModule {}
