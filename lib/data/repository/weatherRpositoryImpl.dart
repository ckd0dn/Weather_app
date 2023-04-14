import 'dart:convert';

import 'package:weather_app/data/source/remote/weather_api.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/util/result.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _api;

  WeatherRepositoryImpl(this._api);

  @override
  Future<Result<WeatherListing>> getWeatherListing() async {

    double lat = 37.55; //위도
    double lon = 126.67; //경도

    //소숫점 4까지 제한
    lat.toStringAsFixed(4);
    lon.toStringAsFixed(4);

    try {
      http.Response response = await _api.getWeatherListings(lat.toString(), lon.toString());
      var data = json.decode(response.body);
      WeatherListing listing = WeatherListing.fromJson(data);
      print(data);
      return Result.success(listing);
    }catch (e) {

      return Result.error(Exception('데이터 로드 실패'));
    }

  }


}