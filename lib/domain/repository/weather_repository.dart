import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';

import '../../util/result.dart';

abstract class WeatherRepository {
  //현재 날씨 가져오기
  Future<Result<WeatherListing>> getWeatherListing();
  //현재 부터 5일동안 3시간당 날씨 가져오기
  Future<Result<List<WeatherListing>>> getWeatherHoursListing();
}