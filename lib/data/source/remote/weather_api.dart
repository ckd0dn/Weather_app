import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather?';
  static const apiKey = '05308929865ddd0a8ced6327b08005bb';

  final http.Client _client;

  WeatherApi({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> getWeatherListings(String lat, String lon) async {

    Uri uri = Uri.parse('${baseUrl}lat=$lat&lon=$lon&appid=$apiKey&lang=kr');

    final response = await _client.get(uri);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch weather data');
    }


    
  }

}