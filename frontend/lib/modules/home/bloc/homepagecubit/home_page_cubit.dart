import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:we_alert/modules/home/models/weather_response_model.dart';
import 'package:we_alert/modules/home/repository/fetchWeatherData/fetch_weather_repo.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final FetchWeatherRepo _fetchWeatherRepo;
  HomePageCubit({required FetchWeatherRepo fetchWeatherRepo})
      : _fetchWeatherRepo = fetchWeatherRepo,
        super(HomePageState.initial());

  Future<void> fetchTemperature(
      {required String latitude,
      required String longitude,
      required String incMessage}) async {
    emit(state.copyWith(temperatureStatus: TemperatureStatus.fetching));
    try {
      WeatherResponse weatherResponse = await _fetchWeatherRepo
          .getCurrentWeather(latitude: latitude, longitude: longitude);
      emit(state.copyWith(
          temperatureStatus: TemperatureStatus.fetched,
          weatherResponse: weatherResponse,
          incrementMessage: incMessage));
    } on Exception catch (e) {
      emit(state.copyWith(temperatureStatus: TemperatureStatus.error));
    }
  }
}
