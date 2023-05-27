import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:stock_watchlist/domain/home/model/json_to_dart.dart';
import 'package:stock_watchlist/infrastructure/search/search_imple.dart';

// import '../../../infrastructure/home/home_implementation.dart';

// import '../../infrastructure/home/home_implementation.dart';

part 'idle_and_search_event.dart';
part 'idle_and_search_state.dart';

List<BestMatch> stocks = [];

class IdleAndSearchBloc extends Bloc<IdleAndSearchEvent, IdleAndSearchState> {
  IdleAndSearchBloc() : super(IdleAndSearchInitial()) {
    on<SerachResponse>((event, emit) async {
      List<BestMatch> searchedStocks =
          await SearchResults().gettingResults(event.query);

      if (searchedStocks.isNotEmpty) {
        return emit(IdleAndSearchState(
          isNull: false,
          searchedProducts: searchedStocks,
          isEmptyStock: false,
        ));
      } else {
        return emit(IdleAndSearchState(
            isNull: false, searchedProducts: [], isEmptyStock: true));
      }
    });
  }
}
