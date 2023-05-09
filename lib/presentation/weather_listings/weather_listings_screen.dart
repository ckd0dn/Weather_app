import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        child: Container(
          width: 250,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(isWeather ?
                state.weathers!.name! : "",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(isWeather ?
                state.weathers!.weather![0].description! : "",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Image(
                  width: 150,
                  height: 150,
                  image: AssetImage('assets/images/sunny.png')),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                                children: [
                                  const TextSpan(
                                    text: "온도 : ",
                                  ),
                                  TextSpan(
                                    text: isWeather ? changeTemp(state.weathers!.main?.temp) : "",
                                  ),
                                  const TextSpan(
                                    text: "도",
                                  ),
                                ]
                            ),),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                                children: [
                                  const TextSpan(
                                    text: "체감온도 : ",
                                  ),
                                  TextSpan(
                                    text: isWeather ? changeTemp(state.weathers!.main?.feels_like) : "",
                                  ),
                                  const TextSpan(
                                    text: "도",
                                  ),
                                ]
                            ),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                                children: [
                                  const TextSpan(
                                    text: "습도 : ",
                                  ),
                                  TextSpan(
                                    text: isWeather ? state.weathers!.main?.humidity?.toInt().toString() : "",
                                  ),
                                  const TextSpan(
                                    text: "%",
                                  ),
                                ]
                            ),),
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 18, color: Colors.white),
                                children: [
                                  const TextSpan(
                                    text: "흐림 : ",
                                  ),
                                  TextSpan(
                                    text: isWeather ? state.weathers!.clouds?.all?.toInt().toString() : "",
                                  ),
                                  const TextSpan(
                                    text: "%",
                                  ),
                                ]
                            ),),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                          children: [
                            const TextSpan(
                              text: "1시간 비의양 : ",
                            ),
                            // TextSpan(
                            //   text: state.weathers.r,
                            // ),
                            const TextSpan(
                              text: "mm",
                            ),
                          ]
                      ),),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                          children: [
                            const TextSpan(
                              text: "1시간 적설량 : ",
                            ),
                            // TextSpan(
                            //   text: state.weathers.r,
                            // ),
                            const TextSpan(
                              text: "mm",
                            ),
                          ]
                      ),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeTemp( double? temp ) {
    if(temp != null){
      String changedTemp = (temp.toInt() - 273).toString();
      return changedTemp;
    }

  }
}
