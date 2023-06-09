import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/application/watchlist/for_watchlist/watchlist_showing_bloc.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/presentation/watchlist/widgets/watchlist_view.dart';

import '../../core/const_widgets.dart';

class MainWatchlistScreen extends StatelessWidget {
  const MainWatchlistScreen({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WatchlistShowingBloc>(context).add(InitializeWatchlist());
    });
    return Scaffold(
      backgroundColor: splashBac,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: splashBac,
        titleSpacing: 20,
        title: const Text(
          "Watchlist",
          style: watchlistTitile,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: const [Expanded(child: WatchlistView())],
      ),
    );
  }
}
