part of 'home_page_cubit.dart';

enum TemperatureStatus { fetching, fetched, error }

class HomePageState extends Equatable {
  const HomePageState(
      {required this.temperatureStatus,
      this.weatherResponse,
      required this.incrementMessage});

  final TemperatureStatus temperatureStatus;
  final WeatherResponse? weatherResponse;
  final String incrementMessage;
  factory HomePageState.initial() => const HomePageState(
      temperatureStatus: TemperatureStatus.fetching,
      weatherResponse: null,
      incrementMessage: '');

  @override
  List<Object?> get props =>
      [temperatureStatus, weatherResponse, incrementMessage];

  HomePageState copyWith({
    TemperatureStatus? temperatureStatus,
    WeatherResponse? weatherResponse,
    String? incrementMessage,
  }) {
    return HomePageState(
      incrementMessage: incrementMessage ?? this.incrementMessage,
      weatherResponse: weatherResponse,
      temperatureStatus: temperatureStatus ?? this.temperatureStatus,
    );
  }
}
