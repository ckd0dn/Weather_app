import 'dart:convert';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
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

    await getLocationPermission();

    //현재위치
    Position position = await Geolocator.getCurrentPosition();

    String lat = position.latitude.toStringAsFixed(6);    //소숫점 4까지 제한
    String lon = position.longitude.toStringAsFixed(6);    //소숫점 4까지 제한

    try {
     final response = await _api.getCurrentWeatherListings(lat, lon);
      var data = json.decode(response.body);
      WeatherListing listing = WeatherListing.fromJson(data);
      return Result.success(listing);
    }catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.error(Exception('데이터 로드 실패'));
    }

  }

  @override
  Future<Result<List<WeatherListing>>> getWeatherHoursListing() async {

    //현재위치
    Position position = await Geolocator.getCurrentPosition();

    String lat = position.latitude.toStringAsFixed(6);    //소숫점 4까지 제한
    String lon = position.longitude.toStringAsFixed(6);    //소숫점 4까지 제한

    try {
      final response = await _api.getWeatherHoursListings(lat, lon);
      var data = json.decode(response.body);
      List datas = data['list'];
      final List<WeatherListing> weatherListing = datas.map((item) => WeatherListing.fromJson(item)).toList();

      return Result.success(weatherListing);
    }catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Result.error(Exception('데이터 로드 실패'));
    }
  }

  Future<void> getLocationPermission() async {

    bool serviceEnabled;
    LocationPermission permission;

    //위치 권한
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

  }




}