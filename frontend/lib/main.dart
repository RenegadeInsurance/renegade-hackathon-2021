import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:we_alert/modules/bottom_nav/bottom_nav.dart';
import 'package:we_alert/modules/forum/repository/get_question_repo.dart';
import 'package:we_alert/modules/home/repository/fetchWeatherData/fetch_weather_repo.dart';
import 'modules/home/bloc/fetchsuggestion/fetchsuggestion_bloc.dart';
import 'modules/home/bloc/geoLocationBloc/geolocationbloc_bloc.dart';
import 'modules/home/repository/fetchaddresssugestion/fetchaddresssuggestion_impl.dart';
import 'modules/home/repository/geolocation/get_geolocation_impl.dart';
import 'modules/home/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetGeoLocationRepository>(
            create: (_) => GetGeoLocationRepository()),
        RepositoryProvider<GetQuestionRepo>(create: (_) => GetQuestionRepo()),
        RepositoryProvider<FetchAddressSuggestion>(
            create: (_) => FetchAddressSuggestion(const Uuid().v4())),
        RepositoryProvider<FetchWeatherRepo>(create: (_) => FetchWeatherRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GeolocationblocBloc>(
              create: (context) => GeolocationblocBloc(
                  getGeoLocationRepository:
                      context.read<GetGeoLocationRepository>(),
                  fetchAddressSuggestion:
                      context.read<FetchAddressSuggestion>())),
          BlocProvider<FetchsuggestionBloc>(
            create: (context) => FetchsuggestionBloc(
                fetchAddressSuggestion: context.read<FetchAddressSuggestion>()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const BottomNav(),
        ),
      ),
    );
  }
}
