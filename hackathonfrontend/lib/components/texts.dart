
import 'package:flutter/material.dart';

Text Heading1 (String text,Color color){
  return Text(text,
                style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.bold),);

}
Text Heading1Bold (String text){
  return Text(text,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),);

}

Text Heading2 (String text,Color color){
  return Text(text,
    style: TextStyle(fontSize: 14,color: color),);

}

Text Heading3 (String text,Color color){
  return Text(text,textAlign: TextAlign.justify,
    style: TextStyle(fontSize: 12,color: color,),);

}

Text Heading4 (String text){
  return Text(text,
    style: TextStyle(fontSize: 20),);

}

Text smallText(String text,Color color){
  return Text(text,style: TextStyle(fontSize: 12,color: color),);
}