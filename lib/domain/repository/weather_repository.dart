import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';

import '../../util/result.dart';

abstract class WeatherRepository {
  Future<Result<WeatherListing>> getWeatherListing();
}