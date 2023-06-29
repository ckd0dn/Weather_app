import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/model/weather_listing/main.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_state.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_view_model.dart';
import 'package:weather_app/presentation/wheather_chart/weather_chart_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../util/utils.dart';

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
                image: AssetImage(Utils().timeSetBackground()),
                fit: BoxFit.cover)),
        child: SizedBox(
          width: 350,
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
                    ? "${" " + Utils().changeTemp(state.weathers!.main?.temp)}°"
                    : "",
                style: TextStyle(fontSize: 44, color: Colors.white),
              ),
              Image(
                  width: 150,
                  height: 150,
                  image: AssetImage(isWeather
                      ? Utils().weatherGIF(state.weathers!.weather![0].main!)
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
                        ? "${"최고:" + Utils().changeTemp(state.weathers!.main?.temp_max)}°"
                        : "최고:",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.only(right: 10)),
                  Text(
                    isWeather
                        ? "${"최저:" + Utils().changeTemp(state.weathers!.main?.temp_min)}°"
                        : "최저:",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: const WeatherChartScreen(),
                      ),
                    );
                  },
                  child: hoursWidget(viewModel, state, isWeather)),
            ],
          ),
        ),
      ),
    );
  }

  Widget hoursWidget(
      WeatherListingsViewModel viewModel, WeatherListingsState state, bool isWeather) {
    return isWeather ? Container(
      height: 130,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: state.weathersList.length,
          itemBuilder: (BuildContext ctx, int idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      Utils().changeDt(state.weathersList[idx].dt_txt!),
                      style: TextStyle(fontSize: 13, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Utils().weatherIcon(state.weathers!.weather![0].main!)
                  ),
                  Text(
                    Utils().changeTemp(state.weathersList[idx].main!.temp) +
                        "°",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
            );
          }),
    ) : const SizedBox();
  }
}
