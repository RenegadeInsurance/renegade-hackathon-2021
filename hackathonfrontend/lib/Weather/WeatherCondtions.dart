import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

 BoxedIcon weatherCondtion(int weatherConditionCode){

  if(weatherConditionCode.toString().startsWith("2")){
    return BoxedIcon(WeatherIcons.thunderstorm,
    color: Colors.grey, size: 40);
  }else if(weatherConditionCode.toString().startsWith("3")){
    return BoxedIcon(WeatherIcons.raindrops,
        color: Colors.grey ,size: 40);
  }
  else if(weatherConditionCode.toString().startsWith("5")){
    return BoxedIcon(WeatherIcons.raindrops,color: Colors.grey,size: 40);
  }else if(weatherConditionCode.toString().startsWith("6")){
    return BoxedIcon(WeatherIcons.snow,color: Colors.white,size: 40);
  }else if(weatherConditionCode.toString().startsWith("7")){
    return BoxedIcon(WeatherIcons.smog,color: Colors.grey,size: 40);
  }else if(weatherConditionCode.toString().contains("800")){
    return BoxedIcon(WeatherIcons.day_sunny,color: Colors.yellow,size: 40,
    );
  }else if(weatherConditionCode.toString().contains("801")){
    return BoxedIcon(WeatherIcons.cloud,color: Colors.grey,size: 40);
  }
  else if(weatherConditionCode.toString().contains("802")){
    return BoxedIcon(WeatherIcons.cloud,color: Colors.grey,size: 40);
  }
  else if(weatherConditionCode.toString().contains("803")){
    return BoxedIcon(WeatherIcons.cloud,color: Colors.grey,size: 40);
  }else if(weatherConditionCode.toString().contains("804")){
    return BoxedIcon(WeatherIcons.cloudy,color: Colors.grey,size: 40);
  }else{
    return BoxedIcon(WeatherIcons.celsius,color: Colors.yellow,size: 40);
  }
}