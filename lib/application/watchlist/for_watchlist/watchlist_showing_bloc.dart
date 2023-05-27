import 'package:bloc/bloc.dart';
import 'package:stock_watchlist/domain/watchlist/model/watchlist_class.dart';

part 'watchlist_showing_event.dart';
part 'watchlist_showing_state.dart';

class WatchlistShowingBloc
    extends Bloc<WatchlistShowingEvent, WatchlistShowingState> {
  WatchlistShowingBloc() : super(WatchlistShowingInitial()) {
    on<InitializeWatchlist>((event, emit) {
      List<Details> stocks = model.values.toList();
      return emit(
          WatchlistShowingState(isLoading: false, watchlistStocks: stocks));
    });
  }
}
