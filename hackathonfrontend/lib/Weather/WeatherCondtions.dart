import 'package:flutter/cupertino.dart';
import 'package:weather_icons/weather_icons.dart';

 weatherCondtion(int weatherConditionCode, Color color){

  if(weatherConditionCode.toString().startsWith("2")){
    return BoxedIcon(WeatherIcons.thunderstorm,
    color: color,);
  }else if(weatherConditionCode.toString().startsWith("3")){
    return BoxedIcon(WeatherIcons.raindrops,
        color: color);
  }
  else if(weatherConditionCode.toString().startsWith("5")){
    return BoxedIcon(WeatherIcons.raindrops,color: color);
  }else if(weatherConditionCode.toString().startsWith("6")){
    return BoxedIcon(WeatherIcons.snow,color: color);
  }else if(weatherConditionCode.toString().startsWith("7")){
    return BoxedIcon(WeatherIcons.smog,color: color);
  }else if(weatherConditionCode.toString().contains("800")){
    return BoxedIcon(WeatherIcons.day_sunny,color: color);
  }else if(weatherConditionCode.toString().contains("801")){
    return BoxedIcon(WeatherIcons.cloud,color: color);
  }
  else if(weatherConditionCode.toString().contains("802")){
    return BoxedIcon(WeatherIcons.cloud,color: color);
  }
  else if(weatherConditionCode.toString().contains("803")){
    return BoxedIcon(WeatherIcons.cloud,color: color);
  }else if(weatherConditionCode.toString().contains("804")){
    return BoxedIcon(WeatherIcons.cloudy,color: color);
  }else{
    return BoxedIcon(WeatherIcons.celsius,color: color);
  }
}