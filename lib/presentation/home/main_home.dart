import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/core/const_widgets.dart';
import 'package:stock_watchlist/main.dart';
import 'package:stock_watchlist/presentation/home/widgets/idle_view.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBac,
      appBar: AppBar(
        backgroundColor: splashBac,
        title: const Text(
          "Welcome to Trade Brains",
          style: homeBarStyle,
        ),
      ),
      body: Column(
        children: [
          homeGap15,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: myMediaQueryData.size.height * 0.06,
              child: CupertinoSearchTextField(
                style: const TextStyle(color: kWhite),
                itemSize: 34,
                itemColor: kWhite,
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(
            height: myMediaQueryData.size.height * 0.01,
          ),
          const Expanded(
            child: SearchIdleView(),
          )
        ],
      ),
    );
  }
}
