import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/application/watchlist/for_watchlist/watchlist_showing_bloc.dart';
import 'package:stock_watchlist/domain/watchlist/model/watchlist_class.dart';

class ForDeletion extends StatelessWidget {
  const ForDeletion({super.key, required this.index});
  final index;
  // final

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Alert!!"),
      content: const Text("Do you Want to Delete this Stock?"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Text("No"),
        ),
        IconButton(
          onPressed: () {
            model.deleteAt(index);
            BlocProvider.of<WatchlistShowingBloc>(context)
                .add(InitializeWatchlist());
            Navigator.pop(context);
          },
          icon: const Text("Yes"),
        ),
      ],
    );
  }
}
