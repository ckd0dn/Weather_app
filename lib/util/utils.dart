import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/wheather_chart/weather_chart_screen.dart';

import '../domain/model/weather_listing/weather_listing.dart';

class Utils {

  //날씨에 따라 GIF 가져오기
  String weatherGIF(String weatherState) {

    switch (weatherState) {
      case 'Clear':
        return 'assets/images/sunny.gif';
      case 'Clouds':
        return 'assets/images/cloudy.gif';
      case 'Rain':
        return 'assets/images/rain.gif';
      case 'Drizzle':
        return 'assets/images/fog.gif';
      case 'Fog':
        return 'assets/images/fog.gif';
      case 'Mist':
        return 'assets/images/fog.gif';
      default:
        return 'assets/images/question.gif';
    }
  }

  //날씨에 따라 아이콘 가져오기
  Widget weatherIcon(String weatherState) {
    switch (weatherState) {
      case 'Clear':
        return const FaIcon(FontAwesomeIcons.sun, color: Colors.white,);
      case 'Clouds':
        return const FaIcon(FontAwesomeIcons.cloud, color: Colors.white,);
      case 'Rain':
        return const FaIcon(FontAwesomeIcons.cloudRain, color: Colors.white,);
      case 'Drizzle':
        return const FaIcon(FontAwesomeIcons.cloudRain, color: Colors.white,);
      case 'Fog':
        return const FaIcon(FontAwesomeIcons.smog, color: Colors.white,);
      case 'Mist':
        return const FaIcon(FontAwesomeIcons.smog, color: Colors.white,);
      default:
        return const FaIcon(FontAwesomeIcons.question, color: Colors.white,);
    }
  }

  //널처리
  isWeatherCheck(bool isWeather, String text) {
    return isWeather ? text : "";
  }

  //화씨 섭씨 변환
  String changeTemp(double? temp) {
    if (temp != null) {
      String changedTemp = '';
      changedTemp = (temp.toInt() - 273).toString();
      return changedTemp;
    }else{
      return '';
    }
  }

  int changeTempInt(double? temp) {
    if (temp != null) {
      int changedTemp = temp.toInt() - 273;
      return changedTemp;
    }else{
      return 0;
    }
  }

  String changeDt(String dt) {
    String subDay = "${dt.substring(5,7)}월${dt.substring(8,10)}일";
    String subDt = dt.substring(10,13);

    if(int.parse(subDt) > 11){
      subDt = "오후$subDt";
    }else{
      subDt = "오전$subDt";
    }

    return "$subDay\n$subDt";
  }

  //밤낮에따른 배경화면
  String timeSetBackground() {
    var currentTime =  DateTime.now().hour;

    String backGroundImage = '';

    if(currentTime > 7 && currentTime < 20) {
       //낮
      backGroundImage = 'assets/images/clearSky.png';
       return backGroundImage;
    }else{
      //밤
      backGroundImage = 'assets/images/night.jpg';
      return backGroundImage;
    }
  }

  //요일 포맷
  String dateFormat(String time) {
    DateTime dt = DateTime.parse(time);
   String result = DateFormat('EEEE').format(dt);
   switch(result) {
     case "Monday":
       result = "월";
       break;
     case "Tuesday":
       result = "화";
       break;
     case "Wednesday":
       result = "수";
       break;
     case "Thursday":
       result = "목";
       break;
     case "Friday":
       result = "금";
       break;
     case "Saturday":
       result = "토";
       break;
     case "Sunday":
       result = "일";
       break;
   }
   return result;
  }

  //일간요악
  String dailySummary(List<WeatherListing> selectedDayList ,SampleItem selectedMenu) {
    late String tempMax = selectedDayList.map((e) => changeTempInt(e.main!.temp!)).fold<int>(0, max).ceil().toString();
    late String tempMin = selectedDayList.map((e) => changeTempInt(e.main!.temp!)).reduce(min).toInt().toString();

    late String humidityMax = selectedDayList.map((e) => e.main!.humidity!.toInt()).fold<int>(0, max).ceil().toString();
    late String humidityMin = selectedDayList.map((e) => e.main!.humidity!.toInt()).reduce(min).toString();

    String day = dateFormat(selectedDayList[0].dt_txt!);
    String result = '';

    if(selectedMenu == SampleItem.temp){
      result = '$day요일 최고 기온은 $tempMax도, 최저기온은 $tempMin도로 예상됩니다';
    }
    if(selectedMenu == SampleItem.humidity){
      result = '$day요일 최고 습도는 $humidityMax%, 최저습도는 $humidityMin%로 예상됩니다';
    }

   return result;
  }

  //필터에 따른 그래프 라벨
  labelText(SampleItem selectedMenu) {
    String label = '';
    switch (selectedMenu) {
      case SampleItem.temp:
        label = '°';
        break;
      case SampleItem.humidity:
        label = '%';
        break;
    }
    return label;
  }

  //필터에 따른 그래프 제목
  titleText(SampleItem selectedMenu) {
    String title = '';
    switch (selectedMenu) {
      case SampleItem.temp:
        title = '기온';
        break;
      case SampleItem.humidity:
        title = '습도';
        break;
    }
    return title;
  }

  LinearGradient weatherGraphGradient(SampleItem selectedMenu) {
    late LinearGradient lg;

    switch (selectedMenu) {
      case SampleItem.temp:
        lg = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(243, 93, 11, 0.9294117647058824),
            Color.fromRGBO(239, 239, 33, 0.6),
            Color.fromRGBO(24, 255, 255, 0.6),
          ],
        );
        break;
      case SampleItem.humidity:
        lg = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(2, 75, 246, 0.8941176470588236),
            Color.fromRGBO(135, 246, 246, 0.9882352941176471),

          ],
        );
        break;
    }
    return lg;
  }

  String nullCheckText( bool isNotNull, String text) {
    return isNotNull ? text : "?";
  }

}