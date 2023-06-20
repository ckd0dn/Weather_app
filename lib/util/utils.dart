import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      case 'Fog':
        return 'assets/images/fog.gif';
      default:
        return '';
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
      case 'Fog':
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
  changeTemp(double? temp) {
    if (temp != null) {
      String changedTemp = (temp.toInt() - 273).toString();
      return changedTemp;
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

}