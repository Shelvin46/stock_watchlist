import 'package:flutter/material.dart';

import '../../../core/const_widgets.dart';

class SearchIdleView extends StatelessWidget {
  const SearchIdleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 50,
                  minHeight: 240,
                  maxWidth: 80,
                  maxHeight: 300,
                ),
                child: Image.asset('assets/pictures/download (5).jpeg',
                    fit: BoxFit.fill),
              ),
              title: const Text(
                'TCS',
                style: mainTitileStyle,
              ),
              subtitle: const Text(
                'Rs 3,000',
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
        itemCount: 10);
  }
}
