import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domain/model/weather_listing/sys.dart';
import 'package:weather_app/domain/model/weather_listing/weather.dart';
import 'package:weather_app/domain/model/weather_listing/wind.dart';


import 'clouds.dart';
import 'coord.dart';
import 'main.dart';

part 'weather_listing.freezed.dart';
part 'weather_listing.g.dart';

@freezed
class WeatherListing with _$WeatherListing {
  const factory WeatherListing({
    required Coord coord,
    required List<Weather> weather,
    required String base,
    required Main main,
    required int visibility,
    required Wind wind,
    required Clouds clouds,
    required int dt,
    required Sys sys,
    required int timezone,
    required int id,
    required String name,
    required int cod,
  }) = _WeatherListing;

  factory WeatherListing.fromJson(Map<String, Object?> json) => _$WeatherListingFromJson(json);
}