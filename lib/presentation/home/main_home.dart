import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_watchlist/application/home/bloc/idle_and_search_bloc.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/core/const_widgets.dart';
import 'package:stock_watchlist/main.dart';
import 'package:stock_watchlist/presentation/home/widgets/search_view.dart';
import '../../core/debouncer/debouncer.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});
  final _debouncer = Debouncer(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBac,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: splashBac,
        title: const Text(
          "Welcome to Trade Brains",
          style: homeBarStyle,
        ),
      ),
      body: ListView(
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
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  } else if (value.isNotEmpty) {
                    _debouncer.run(() {
                      BlocProvider.of<IdleAndSearchBloc>(context)
                          .add(SerachResponse(query: value, context: context));
                    });
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: myMediaQueryData.size.height * 0.01,
          ),
          BlocBuilder<IdleAndSearchBloc, IdleAndSearchState>(
            builder: (context, state) {
              if (state.isNull == true) {
                return Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                          "assets/animation/8852-searching-for-word.json",
                          fit: BoxFit.cover),
                    ),
                    findStocks
                  ],
                );
              } else if (state.isEmptyStock == true) {
                return Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                        "assets/animation/8852-searching-for-word.json",
                        fit: BoxFit.cover,
                      ),
                    ),
                    errorSearch1,
                    errorSearch2
                  ],
                );
              } else {
                return Expanded(child: SearchView());
              }
            },
          ),
        ],
      ),
    );
  }
}
