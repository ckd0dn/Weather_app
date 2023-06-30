import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/domain/model/weather_listing/clouds.dart';
import 'package:weather_app/domain/model/weather_listing/sys.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_state.dart';

import '../../domain/model/weather_listing/coord.dart';
import '../../domain/model/weather_listing/main.dart';
import '../../domain/model/weather_listing/weather.dart';
import '../../domain/model/weather_listing/wind.dart';

class WeatherListingsViewModel with ChangeNotifier {
  final WeatherRepository _weatherRepository;

  var _state = const WeatherListingsState(
      weathers: WeatherListing(
        coord: Coord( lon: 0, lat: 0),
        weather: [Weather( id: 0, main: '', description: '', icon: '')],
        base: '',
        main: Main(temp: 273, feels_like: 273, temp_max: 273, temp_min: 273, pressure: 0, humidity: 0, sea_level: 0, grnd_level: 0),
        visibility: 0,
        wind: Wind(speed: 0, deg: 0, gust: 0),
        clouds: Clouds(all: 0),
        dt: 0,
        sys: Sys(type: 0, id: 0, country: '', sunrise: 0, sunset: 0,),
        timezone: 0,
        id: 0,
        name: '',
        cod: 0,
        dt_txt: '',

      ));

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
        if (kDebugMode) {
          print("날씨 조회 에러");
        }
        if (kDebugMode) {
          print(e);
        }
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
        if (kDebugMode) {
          print(listings.length);
        }

        _state = state.copyWith(
          weathersList: listings,
        );
      },
      error: (e) {
        if (kDebugMode) {
          print("날씨 조회 에러");
        }
        if (kDebugMode) {
          print(e);
        }
      },
    );

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }


}
