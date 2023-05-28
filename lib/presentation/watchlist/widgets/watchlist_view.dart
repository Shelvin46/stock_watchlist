import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:stock_watchlist/application/watchlist/for_watchlist/watchlist_showing_bloc.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/presentation/home/widgets/search_view.dart';

import '../../../core/const_widgets.dart';
import 'for_deletion.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WatchlistShowingBloc>(context).add(InitializeWatchlist());
    });
    return BlocBuilder<WatchlistShowingBloc, WatchlistShowingState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.watchlistStocks.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/61212-add-to-watchlistcart.json',
                ),
                watchlistGap,
                emptyWatchlist
              ],
            ),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) {
              final eachStock = state.watchlistStocks[index];
              return ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 240,
                      maxWidth: 80,
                      maxHeight: 300,
                    ),
                    child: Image.asset(image, fit: BoxFit.fill),
                  ),
                  title: Text(
                    eachStock.companyName.toString(),
                    style: mainTitileStyle,
                  ),
                  subtitle: Text(
                    eachStock.matchScore.toString(),
                    style: subTitleStyle,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 19),
                    child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return ForDeletion(index: index);
                            },
                          );
                        },
                        child: trailingDeleting),
                  ));
            },
            separatorBuilder: (context, index) {
              return homeDivider;
            },
            itemCount: state.watchlistStocks.length);
      },
    );
  }
}
