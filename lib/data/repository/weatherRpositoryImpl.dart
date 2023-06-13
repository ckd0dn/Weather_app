import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/data/source/remote/weather_api.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/util/result.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _api;

  WeatherRepositoryImpl(this._api);

  @override
  Future<Result<WeatherListing>> getWeatherListing() async {

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "위치서비스가 불가능합니다");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "위치서비스 권한이 거부되었습니다");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "위치서비스가 권한이 영구적으로 거부되어있어\n권한 요청이 불가능합니다");
      await AppSettings.openAppSettings();
    }

    Position position = await Geolocator.getCurrentPosition();

    String lat = position.latitude.toStringAsFixed(6);    //소숫점 4까지 제한
    String lon = position.longitude.toStringAsFixed(6);    //소숫점 4까지 제한


    try {
      http.Response response = await _api.getWeatherListings(lat, lon);
      var data = json.decode(response.body);
      WeatherListing listing = WeatherListing.fromJson(data);
      print(data);
      return Result.success(listing);
    }catch (e) {
      print(e);
      return Result.error(Exception('데이터 로드 실패'));
    }

  }


}