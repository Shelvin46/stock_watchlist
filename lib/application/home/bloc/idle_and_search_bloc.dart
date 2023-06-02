
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stock_watchlist/domain/home/model/json_to_dart.dart';
import 'package:stock_watchlist/infrastructure/search/search_imple.dart';
import '../../../core/color_constants.dart';
part 'idle_and_search_event.dart';

part 'idle_and_search_state.dart';

class IdleAndSearchBloc extends Bloc<IdleAndSearchEvent, IdleAndSearchState> {
  IdleAndSearchBloc() : super(IdleAndSearchInitial()) {
    on<SerachResponse>((event, emit) async {
       emit(IdleAndSearchState(
          isLoading: true,
          isEmptyStock: false,
          isNull: false,
          searchedProducts: []));
      List<BestMatch> searchedStocks =
          await SearchResults().gettingResults(event.query, event.context);
      emit(IdleAndSearchState(
          isNull: false,
          searchedProducts: searchedStocks,
          isLoading: false,
          isEmptyStock: searchedStocks.isEmpty));//if the searched list comes  to empty it will emit empty.
    });
  }
}
