import 'package:weather/weather.dart';

class WeatherData {
  String key = '66764e869b31a33bf0f35d40b7aadf44';


  Future<Weather> fetchWeatherOwn(lat, lon) async {
    WeatherFactory wf = WeatherFactory(key);
    Weather w = await wf.currentWeatherByLocation(lat, lon);

    return w;
  }

  Future<Weather> fetchWeatherCity(String cityName) async {
    WeatherFactory wf = WeatherFactory(key);
    Weather w = await wf.currentWeatherByCityName(cityName);

    return w;
  }

  Future<List<Weather>> fetchWeatherFiveDayOwn(lat, lon) async {
    WeatherFactory wf = WeatherFactory(key);
    List<Weather> forecast = await wf.fiveDayForecastByLocation(lat, lon);

    return forecast;
  }
}
