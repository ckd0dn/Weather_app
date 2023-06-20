import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_state.dart';

class WeatherListingsViewModel with ChangeNotifier {
  final WeatherRepository _weatherRepository;

  var _state = const WeatherListingsState();

  WeatherListingsState get state => _state;

  WeatherListingsViewModel(this._weatherRepository) {
    init();
  }

  Future<void> init() async {
    await _getWeatherListings();
    _getWeatherHoursListings();
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

  Future _getWeatherHoursListings() async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _weatherRepository.getWeatherHoursListing();

    result.when(
      success: (listings) {
        print(listings.length);

        _state = state.copyWith(
          weathersList: listings,
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


}
