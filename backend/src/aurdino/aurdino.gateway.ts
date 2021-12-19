import { WebSocketGateway, WebSocketServer } from '@nestjs/websockets';
import { Server } from 'http';

const SerialPort = require("serialport");
const Readline = require(
"@serialport/parser-readline"
) 
import {sendMessage} from "./helper"

@WebSocketGateway({
  transport:["websocket","polling"]
})
export class AurdinoGateway {

  constructor(
  ) {
    const port:any = new SerialPort("COM5",{baudRate:9600});
    const parser:any = new Readline()
    setInterval(()=>{
      sent=false
    },20000000)
    port.pipe(parser)
    let sent=false;

    parser.on("data",(data)=>{
      if (data > 490 && sent === false) {
        sendMessage();
        sent=true
      };
      this.server?.emit("stream",data)})
  }

  @WebSocketServer() 
  server:Server;
  
  

    
}
