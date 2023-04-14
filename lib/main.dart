import 'package:flutter/material.dart';
import 'package:weather_app/data/repository/weatherRpositoryImpl.dart';
import 'package:weather_app/data/source/remote/weather_api.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => WeatherListingsViewModel(
          WeatherRepositoryImpl(WeatherApi()),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WeatherListingsScreen());
  }
}
