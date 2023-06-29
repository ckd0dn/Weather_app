import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_app/domain/model/weather_listing/weather_listing.dart';

import '../../util/utils.dart';
import '../weather_listings/weather_listings_view_model.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class WeatherChartScreen extends StatefulWidget {
  const WeatherChartScreen({Key? key}) : super(key: key);

  @override
  State<WeatherChartScreen> createState() => _WeatherChartScreenState();
}

class _WeatherChartScreenState extends State<WeatherChartScreen> {
  int _selectedIndex = 0;

  SampleItem? selectedMenu;

  String subStringDt(String dt) {
    String timeString = "${dt.substring(8, 10)}일${dt.substring(11, 13)}시";

    return timeString;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<WeatherListingsViewModel>();
    final List<WeatherListing> weatherInfos = viewModel.state.weathersList;

    //가져온 날짜의 일 리스트
    final days =
        weatherInfos.map((e) => e.dt_txt!.substring(8, 10)).toSet().toList();

    //각각의 일에 해당하는 날씨 데이터 리스트 예(1,2,3,4,5,6일에 해당하는 날씨 리스트)
    final dayList1 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[0])
        .toList();
    final dayList2 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[1])
        .toList();
    final dayList3 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[2])
        .toList();
    final dayList4 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[3])
        .toList();
    final dayList5 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[4])
        .toList();
    final dayList6 = weatherInfos
        .where((e) => e.dt_txt!.substring(8, 10) == days[5])
        .toList();

    final dayList = [
      dayList1,
      dayList2,
      dayList3,
      dayList4,
      dayList5,
      dayList6
    ];

    //칩으로 선택된 날씨 데이터
    late List<WeatherListing> _selectedDayList;
    List<_SplineAreaData> chartData = [];

    // print(dayList1.toList());

    switch (_selectedIndex + 1) {
      case 1:
        _selectedDayList = dayList[_selectedIndex];
        break;
      case 2:
        _selectedDayList = dayList[_selectedIndex];
        break;
      case 3:
        _selectedDayList = dayList[_selectedIndex];
        break;
      case 4:
        _selectedDayList = dayList[_selectedIndex];
        break;
      case 5:
        _selectedDayList = dayList[_selectedIndex];
        break;
      case 6:
        _selectedDayList = dayList[_selectedIndex];
        break;
    }

    for (var e in _selectedDayList) {
      chartData.add(
        _SplineAreaData(
          subStringDt(e.dt_txt!),
          Utils().changeTempInt(e.main!.temp!),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //색변경
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                days.length,
                (int index) {
                  return ChoiceChip(
                    label: Text(
                        "${days[index]}일 ${Utils().dateFormat(dayList[index][0].dt_txt!)}"),
                    selected: _selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedIndex = index;
                        }
                      });
                    },
                  );
                },
              ).toList(),
            ),
            Container(
              padding: const EdgeInsets.only(left:20 ,top: 30),
              alignment: Alignment.centerLeft,
              child: Row(

                children: [

                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text("필터", style: TextStyle(fontSize: 14, color: Colors.white),),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(100, 100, 100, 100),
                    child: PopupMenuButton<SampleItem>(
                      iconSize: 24,
                      tooltip: "필터",
                      shadowColor: Colors.grey,
                      color: Colors.white,
                      icon: const FaIcon(FontAwesomeIcons.temperatureHalf),
                      initialValue: selectedMenu,
                      // Callback that sets the selected popup menu item.
                      onSelected: (SampleItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemOne,
                          child: Text('기온'),
                        ),
                        const PopupMenuItem<SampleItem>(
                          value: SampleItem.itemTwo,
                          child: Text('습도'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: _buildSplineAreaChart(chartData)),

            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left:20 ,top: 16),
              child: const Text("일간요악", style: TextStyle(fontSize: 24, color: Colors.white),),
            ),
            Container(
              decoration:  BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left:20 ,top: 16, right: 20),
              padding: const EdgeInsets.all(10),
              child: Text(Utils().dailySummary(_selectedDayList), style: const TextStyle(fontSize: 14, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  /// 스플라인 영역 차트를 반환합니다.
  SfCartesianChart _buildSplineAreaChart(List<_SplineAreaData> chartData) {
    return SfCartesianChart(
      title: ChartTitle(
          text: '기온', textStyle: const TextStyle(color: Colors.white)),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        labelStyle: const TextStyle(color: Colors.white),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelStyle: const TextStyle(color: Colors.white),
          labelFormat: '{value}°',
          axisLine: const AxisLine(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getSplineAreaSeries(chartData),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// 차트 시리즈 목록을 반환합니다
  /// 스플라인 영역 차트에 렌더링해야 합니다.
  List<ChartSeries<_SplineAreaData, String>> _getSplineAreaSeries(
      List<_SplineAreaData> chartData) {
    return <ChartSeries<_SplineAreaData, String>>[
      SplineAreaSeries<_SplineAreaData, String>(
        opacity: 0.5,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(243, 93, 11, 0.9294117647058824),
            Color.fromRGBO(239, 239, 33, 0.6),
            Color.fromRGBO(24, 255, 255, 0.6),
          ],
        ),
        name: "기온",
        dataSource: chartData,
        color: const Color.fromRGBO(239, 239, 33, 0.6),
        borderColor: const Color.fromRGBO(255, 255, 0, 0.6),
        borderWidth: 4,
        xValueMapper: (_SplineAreaData sales, _) => sales.year,
        yValueMapper: (_SplineAreaData sales, _) => sales.temp.toInt(),
      ),
    ];
  }
}

/// Private class for storing the spline area chart datapoints.
class _SplineAreaData {
  _SplineAreaData(this.year, this.temp);

  final String year;
  final int temp;
}
