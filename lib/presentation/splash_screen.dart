// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_watchlist/application/home/bloc/idle_and_search_bloc.dart';
// import 'package:stock_watchlist/application/home/idle_and_search/idle_and_search_bloc.dart';
import 'package:stock_watchlist/core/bottomnav.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/core/const_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    awaitingSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBac,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/74398-analyze-illustration.json'),
          const Text(
            "#Lets Trade Up",
            style: indroTextStyle,
          )
        ],
      ),
    );
  }

  Future<void> awaitingSplashScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return const BottomNavBar();
      },
    ));
  }
}
