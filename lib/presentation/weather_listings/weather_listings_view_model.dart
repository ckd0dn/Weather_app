import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_state.dart';

class WeatherListingsViewModel with ChangeNotifier {
  final WeatherRepository _weatherRepository;

  var _state = const WeatherListingsState();

  WeatherListingsState get state => _state;

  WeatherListingsViewModel(this._weatherRepository) {
    _getWeatherListings();
  }

  Future _getWeatherListings() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _weatherRepository.getWeatherListing();

    result.when(
      success: (listings) {
        _state = state.copyWith(
          weathers: listings,
        );
      },
      error: (e) {
        print("날씨 조회 에러");
        print(e);
      },
    );

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }

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
}
