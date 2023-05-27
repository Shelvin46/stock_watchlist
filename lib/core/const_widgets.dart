import 'package:flutter/material.dart';

import 'color_constants.dart';

const indroTextStyle =
    TextStyle(color: kWhite, fontSize: 40, fontWeight: FontWeight.bold);
const homeBarStyle =
    TextStyle(fontWeight: FontWeight.bold, color: kWhite, fontSize: 24);
//<-------------------------------------------------------------------------------------Splash Screen=----------------------------------------------------------------------------->
const homeGap15 = SizedBox(
  width: 16,
);
const homeIconSearch = Icon(
  Icons.search,
  color: kWhite,
  size: 30,
);
const homeDivider = Divider(
  color: kWhite,
);
const mainTitileStyle = TextStyle(color: kWhite, fontSize: 18);
const subTitleStyle = TextStyle(color: kWhite, fontSize: 14);
const trailingAdding = Icon(
  Icons.add,
  color: kWhite,
  size: 38,
);
const findStocks = Text(
  "Find Your Stocks",
  style: TextStyle(color: kWhite, fontSize: 35),
);
const errorSearch1 = Text(
  "OOPS!",
  style: TextStyle(color: kWhite, fontSize: 30),
);
const errorSearch2 = Text(
  'Stock does not Found!!',
  style: TextStyle(color: kWhite, fontSize: 28),
);
//<-----------------------------------------------------------------------------------Home Screen----------------------------------------------------------------->
const watchlistTitile =
    TextStyle(fontWeight: FontWeight.bold, color: kWhite, fontSize: 30);
const trailingDeleting = Icon(
  Icons.delete,
  color: kWhite,
);
//<---------------------------------------------------------------------------------Watch List---------------------------------------------------------------------->