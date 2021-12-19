const accountSid = 'AC44d75da8b4bff466221e8014b36ea43c'; 
const authToken = '43e8b4d167cc9b1f35d01a21a14b3e88'; 
const client = require('twilio')(accountSid, authToken); 



export const sendMessage = ()=>{
    return client.messages 
          .create({ 
             body: 'Water level has severly increased. Chances of flood is high',  
             messagingServiceSid: 'MGd6fd92f25fb4f469aae817419f88219e',      
             to: '+9779869392456' 
           }) 
          .then(message => console.log(message.sid)) 
          .done();
}