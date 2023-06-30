import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home_screen/scroll_to_hide_widget.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_screen.dart';
import 'package:weather_app/presentation/wheather_map/weather_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  int _index = 0;
  bool _isScrollPage = true;

  final List _pages = [const WeatherListingsScreen(), const WeatherMapScreen()];

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body:
        //스크롤 가능한 페이지면 바텀네비게이션 움직이게함
        _isScrollPage ?
        SingleChildScrollView(
          controller: scrollController,
          child:  _pages[_index],
        ) :  _pages[_index],
        bottomNavigationBar: ScrollToHideWidget(
          controller: scrollController,
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.sunny,),
                label: 'weather',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map,),
                label: 'map',
              ),
            ],
            currentIndex: _index, // 지정 인덱스로 이동
            selectedItemColor: Colors.greenAccent,
            onTap: (index) {
              setState(() {
                _index = index;
                if(index == 0) {
                  _isScrollPage = true;
                }else if (index == 1) {
                  _isScrollPage = false;
                }
              });
            }, // 선언했던 onItemTapped
          ),
        ),
      ),
    );
  }

}
