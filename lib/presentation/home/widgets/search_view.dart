// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_watchlist/core/color_constants.dart';
import 'package:stock_watchlist/domain/watchlist/model/watchlist_class.dart';
import '../../../application/home/bloc/idle_and_search_bloc.dart';
import '../../../core/const_widgets.dart';

String image = 'assets/pictures/image.jpg';

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
            physics: const ScrollPhysics(),
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
                    child: Image.asset(image, fit: BoxFit.fill),
                  ),
                  title: Text(
                    eachStock.the2Name,
                    style: mainTitileStyle,
                  ),
                  subtitle: Text(
                    eachStock.the9MatchScore,
                    style: subTitleStyle,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 19),
                    child: InkWell(
                      onTap: () async {
                        final checking = model.values.toList();
                        if (checking
                            .where((element) =>
                                element.companyName == eachStock.the2Name)
                            .isEmpty) {
                          await Details.addingDetails(
                            eachStock.the2Name,
                            eachStock.the9MatchScore,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              forToast('Stock Added into Watchlist', kBlue));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            forToast('Already Added!!', kRed),
                          );
                        }
                      },
                      child: trailingAdding,
                    ),
                  ));
            },
            separatorBuilder: (context, index) {
              return homeDivider;
            },
            itemCount: state.searchedProducts.length);
      },
    );
  }

  SnackBar forToast(String content, Color color) {
    return SnackBar(
      backgroundColor: color,
      content: Text(content),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: splashBac, width: 2.0),
      ),
    );
  }
}
