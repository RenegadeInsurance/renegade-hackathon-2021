
import 'package:flutter/material.dart';

Text Heading20Bold (String text,Color color){
  return Text(text,
                style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.bold),);

}
Text Heading16Bold (String text,Color color){
  return Text(text,
    style: TextStyle(color:color,fontSize: 16, fontWeight: FontWeight.bold),);

}

Text Heading14 (String text,Color color){
  return Text(text,
    style: TextStyle(fontSize: 14,color: color),);

}Text Heading14Bold (String text,Color color){
  return Text(text,
    style: TextStyle(fontSize: 14,color: color, fontWeight: FontWeight.bold),);

}

Text Heading16 (String text,Color color){
  return Text(text,
    style: TextStyle(fontSize: 16,color: color),);

}


Text Heading12 (String text,Color color){
  return Text(text,textAlign: TextAlign.justify,
    style: TextStyle(fontSize: 12,color: color,),);

}

Text Heading20 (String text){
  return Text(text,
    style: TextStyle(fontSize: 20),);

}

Text smallText(String text,Color color){
  return Text(text,style: TextStyle(fontSize: 12,color: color),);
}