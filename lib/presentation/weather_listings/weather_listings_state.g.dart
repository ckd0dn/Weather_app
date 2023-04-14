// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_listings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherListingsState _$$_WeatherListingsStateFromJson(
        Map<String, dynamic> json) =>
    _$_WeatherListingsState(
      weathers: json['weathers'] == null
          ? null
          : WeatherListing.fromJson(json['weathers'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$_WeatherListingsStateToJson(
        _$_WeatherListingsState instance) =>
    <String, dynamic>{
      'weathers': instance.weathers,
      'isLoading': instance.isLoading,
    };
