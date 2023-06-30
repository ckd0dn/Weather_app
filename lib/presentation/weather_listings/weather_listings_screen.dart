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

    final mobileHeight = MediaQuery.of(context).size.height;

    return Container(
      height: mobileHeight,
      alignment: Alignment.center,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Utils().timeSetBackground()),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.weathers!.name!,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
              "${" ${Utils().changeTemp(state.weathers!.main!.temp)}"}°",
            style: const TextStyle(fontSize: 44, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Image(
                width: 150,
                height: 150,
                image: AssetImage(state.weathers!.weather!.isNotEmpty
                    ? Utils().weatherGIF(state.weathers!.weather![0].main!)
                    : "assets/images/question.gif")),
          ),
          Text(
            state.weathers!.weather![0].description!,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${"최고:${Utils().changeTemp(state.weathers!.main?.temp_max)}"}°",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const Padding(padding: EdgeInsets.only(right: 10)),
              Text(
                "${"최저:${Utils().changeTemp(state.weathers!.main?.temp_min)}"}°",
                style: const TextStyle(fontSize: 20, color: Colors.white),
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
              child: hoursWeatherInfo(viewModel, state, isWeather)),
          detailInfoWeather(viewModel, state, isWeather),
        ],
      ),
    );
  }

  Widget hoursWeatherInfo(WeatherListingsViewModel viewModel,
      WeatherListingsState state, bool isWeather) {
    return Container(
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
                      child: Utils().weatherIcon(
                          state.weathers!.weather![0].main!)),
                  Text(
                    "${Utils().changeTemp(state.weathersList[idx].main!.temp)}°",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget detailInfoWeather(WeatherListingsViewModel viewModel,
      WeatherListingsState state, bool isWeather) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "체감온도",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "흐림",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "습도",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "대기압",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "바람 속도",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "풍향",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "가시성",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${Utils().changeTemp(state.weathers!.main?.feels_like)} °",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.clouds!.all!.toInt().toString()} %",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.main!.humidity!.toInt().toString()} %",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.main!.pressure!.toInt().toString()} hPa",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.wind!.speed!.toInt().toString()} m/s",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.wind!.deg!.toInt().toString()} °",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${state.weathers!.visibility.toString()} m",
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
