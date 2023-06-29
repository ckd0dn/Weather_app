import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/presentation/weather_listings/weather_listings_screen.dart';
import 'package:weather_app/presentation/wheather_map/weather_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List _pages = [const WeatherListingsScreen(), const WeatherMapScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: _pages[_index],
        bottomNavigationBar: BottomNavigationBar(
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
            });
          }, // 선언했던 onItemTapped
        ),
      ),
    );
  }

}
