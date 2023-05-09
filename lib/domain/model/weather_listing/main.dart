import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class Main with _$Main {
  const factory Main({
     double? temp,
     double? feels_like,
     double? temp_min,
     double? temp_max,
     double? pressure,
     double? humidity,
     double? sea_level,
     double?grnd_level,
  }) = _Main;

  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
}