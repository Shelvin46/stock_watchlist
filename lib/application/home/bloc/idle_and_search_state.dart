part of 'idle_and_search_bloc.dart';

class IdleAndSearchState {
  List<BestMatch> searchedProducts;
  bool isNull;
  bool isEmptyStock;
  bool isLoading;

  IdleAndSearchState(
      {required this.isNull,
      required this.searchedProducts,
      required this.isEmptyStock,
      required this.isLoading});
}

class IdleAndSearchInitial extends IdleAndSearchState {
  IdleAndSearchInitial()
      : super(
            isNull: true,
            searchedProducts: [],
            isEmptyStock: false,
            isLoading: false);
}
