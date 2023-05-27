part of 'idle_and_search_bloc.dart';

class IdleAndSearchState {
  List<dynamic> searchedProducts;
  bool isNull;
  bool isEmptyStock;
  IdleAndSearchState(
      {required this.isNull,
      required this.searchedProducts,
      required this.isEmptyStock});
}

class IdleAndSearchInitial extends IdleAndSearchState {
  IdleAndSearchInitial()
      : super(isNull: true, searchedProducts: [], isEmptyStock: false);
}
