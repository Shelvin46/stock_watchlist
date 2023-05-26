import 'package:flutter/material.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/presentation/watchlist/widgets/watchlist_view.dart';

import '../../core/const_widgets.dart';

class MainWatchlistScreen extends StatelessWidget {
  const MainWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBac,
      appBar: AppBar(
        backgroundColor: splashBac,
        titleSpacing: 20,
        title: const Text(
          "Watchlist",
          style: watchlistTitile,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [Expanded(child: WatchlistView())],
      ),
    );
  }
}
