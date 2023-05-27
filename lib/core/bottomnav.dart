import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/presentation/home/main_home.dart';
import 'package:stock_watchlist/presentation/watchlist/main_watchlist.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentSelectedIndex = 0;
  List pages = [MainHomeScreen(), MainWatchlistScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: splashBac,
        currentIndex: currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            currentSelectedIndex = newIndex;
          });
        },
        selectedIconTheme: const IconThemeData(color: kWhite),
        unselectedIconTheme: const IconThemeData(color: kgrey),
        unselectedItemColor: kgrey,
        fixedColor: kWhite,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
