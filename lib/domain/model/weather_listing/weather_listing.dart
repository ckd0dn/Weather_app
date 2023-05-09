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
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) = _WeatherListing;

  factory WeatherListing.fromJson(Map<String, Object?> json) => _$WeatherListingFromJson(json);
}