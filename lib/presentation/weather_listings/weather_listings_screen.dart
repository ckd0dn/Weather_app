import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/model/weather_listing/main.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_state.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_view_model.dart';

class WeatherListingsScreen extends StatelessWidget {
  const WeatherListingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherListingsViewModel>();
    final state = viewModel.state;
    final isWeather = state.weathers != null;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/afternoon.jpg'),
                fit: BoxFit.cover)),
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isWeather ? state.weathers!.name! : "",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                isWeather
                    ? "${" " + viewModel.changeTemp(state.weathers!.main?.temp)}°"
                    : "",
                style: TextStyle(fontSize: 44, color: Colors.white),
              ),
              Image(
                  width: 150,
                  height: 150,
                  image: AssetImage(isWeather
                      ? viewModel.weatherGIF(state.weathers!.weather![0].main!)
                      : "assets/images/question.gif")),
              Text(
                isWeather ? state.weathers!.weather![0].description! : "",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isWeather
                        ? "${"최고:" + viewModel.changeTemp(state.weathers!.main?.temp_max)}°"
                        : "최고:",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Text(
                    isWeather
                        ? "${"최저:" + viewModel.changeTemp(state.weathers!.main?.temp_min)}°"
                        : "최저:",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "지금",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Icon(Icons.sunny, size: 24, color: Colors.white,),
                    Text(
                      "19°",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
