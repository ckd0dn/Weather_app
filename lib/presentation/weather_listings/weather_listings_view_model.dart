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
      },
    );

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }
}
