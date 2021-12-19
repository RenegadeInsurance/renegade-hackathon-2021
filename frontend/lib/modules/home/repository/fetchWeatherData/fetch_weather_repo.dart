import 'package:dio/dio.dart';
import 'package:we_alert/constants/api_constants.dart';
import 'package:we_alert/modules/home/models/weather_response_model.dart';

class FetchWeatherRepo {
  Future<WeatherResponse> getCurrentWeather(
      {required String latitude, required String longitude}) async {
    try {
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${ApiContants.weatherAPI}';
      Dio dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.get(url);

      WeatherResponse weatherResponse = WeatherResponse.fromMap(response.data);
      return weatherResponse;
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
