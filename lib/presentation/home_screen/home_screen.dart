import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
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
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: _pages[_index],
      bottomNavigationBar: FloatingNavbar(

        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.sunny, title: 'Weather'),
          FloatingNavbarItem(icon: Icons.map, title: 'Weather Map'),
        ],
      ),
    );
  }

}
