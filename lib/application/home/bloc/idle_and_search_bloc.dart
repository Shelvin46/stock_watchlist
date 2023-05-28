// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:stock_watchlist/domain/home/model/json_to_dart.dart';
import 'package:stock_watchlist/infrastructure/search/search_imple.dart';

import '../../../core/color_constants.dart';
part 'idle_and_search_event.dart';
part 'idle_and_search_state.dart';

List<BestMatch> stocks = [];

class IdleAndSearchBloc extends Bloc<IdleAndSearchEvent, IdleAndSearchState> {
  IdleAndSearchBloc() : super(IdleAndSearchInitial()) {
    on<SerachResponse>((event, emit) async {
      showDialog(
        context: event.context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
              color: kWhite,
              backgroundColor: splashBac,
            ),
          );
        },
      );
      List<BestMatch> searchedStocks =
          await SearchResults().gettingResults(event.query, event.context);
      Navigator.pop(event.context);
      if (searchedStocks.isNotEmpty) {
        return emit(IdleAndSearchState(
            isNull: false,
            searchedProducts: searchedStocks,
            isEmptyStock: false));
      } else {
        return emit(IdleAndSearchState(
            isNull: false, searchedProducts: [], isEmptyStock: true));
      }
    });
  }
}
