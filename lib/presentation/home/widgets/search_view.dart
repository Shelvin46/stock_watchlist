import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/home/bloc/idle_and_search_bloc.dart';
import '../../../core/const_widgets.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdleAndSearchBloc, IdleAndSearchState>(
      builder: (context, state) {
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final eachStock = state.searchedProducts[index];
              return ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50,
                      minHeight: 240,
                      maxWidth: 80,
                      maxHeight: 300,
                    ),
                    child: Image.asset('assets/pictures/image.jpg',
                        fit: BoxFit.fill),
                  ),
                  title: Text(
                    eachStock.the2Name,
                    style: mainTitileStyle,
                  ),
                  subtitle: Text(
                    eachStock.the9MatchScore,
                    style: subTitleStyle,
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.only(right: 19),
                    child: trailingAdding,
                  ));
            },
            separatorBuilder: (context, index) {
              return homeDivider;
            },
            itemCount: state.searchedProducts.length);
      },
    );
  }
}
