import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/weather_listing/weather_listing.dart';

part 'weather_listings_state.freezed.dart';
part 'weather_listings_state.g.dart';

@freezed
class WeatherListingsState with _$WeatherListingsState {
  const factory WeatherListingsState({
    WeatherListing? weathers,
    @Default([]) List<WeatherListing> weathersList,
    @Default(false) bool isLoading,
  }) = _WeatherListingsState;

  factory WeatherListingsState.fromJson(Map<String, Object?> json) => _$WeatherListingsStateFromJson(json);
}