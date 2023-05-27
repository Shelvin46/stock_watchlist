// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:stock_watchlist/domain/home/model/json_to_dart.dart';
import '../api_key.dart';

class SearchResults {
  Future<List<BestMatch>> gettingResults(String query) async {
    List<BestMatch> searchedStocks = [];
    var jsonData;
    try {
      var response = await http.get(Uri.parse(
          'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=$query&apikey=$apiKey'));
      if (response.statusCode == 200) {
        jsonData = jsonDecode(response.body);
        var stockDetailsList = StockDetails.fromJson(jsonData);
        searchedStocks = stockDetailsList.bestMatches;
      }
    } catch (e) {
      log(e.toString());
    }
    return searchedStocks;
  }
}
