part of 'watchlist_showing_bloc.dart';

class WatchlistShowingState {
  List<Details> watchlistStocks;
  bool isLoading;
  WatchlistShowingState(
      {required this.isLoading, required this.watchlistStocks});
}

class WatchlistShowingInitial extends WatchlistShowingState {
  WatchlistShowingInitial() : super(isLoading: true, watchlistStocks: []);
}
