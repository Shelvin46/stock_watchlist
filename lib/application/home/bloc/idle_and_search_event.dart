part of 'idle_and_search_bloc.dart';

class IdleAndSearchEvent {}

class InitialResponse extends IdleAndSearchEvent {}

class SerachResponse extends IdleAndSearchEvent {
  String query;
  BuildContext context;
  SerachResponse({required this.query,required this.context});
}
