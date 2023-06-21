
import "package:flutter/material.dart";

import '../../domain/repository/weather_repository.dart';

class WeatherMapViewModel with ChangeNotifier {

  final WeatherRepository _weatherRepository;

  WeatherMapViewModel(this._weatherRepository) {

  }


}