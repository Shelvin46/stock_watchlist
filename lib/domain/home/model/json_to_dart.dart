import 'dart:convert';

StockDetails stockDetailsFromJson(String str) => StockDetails.fromJson(json.decode(str));

String stockDetailsToJson(StockDetails data) => json.encode(data.toJson());

class StockDetails {
    List<BestMatch> bestMatches;

    StockDetails({
        required this.bestMatches,
    });

    factory StockDetails.fromJson(Map<String, dynamic> json) => StockDetails(
        bestMatches: List<BestMatch>.from(json["bestMatches"].map((x) => BestMatch.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "bestMatches": List<dynamic>.from(bestMatches.map((x) => x.toJson())),
    };
}

class BestMatch {
    String the1Symbol;
    String the2Name;
    String the3Type;
    String the4Region;
    String the5MarketOpen;
    String the6MarketClose;
    String the7Timezone;
    String the8Currency;
    String the9MatchScore;

    BestMatch({
        required this.the1Symbol,
        required this.the2Name,
        required this.the3Type,
        required this.the4Region,
        required this.the5MarketOpen,
        required this.the6MarketClose,
        required this.the7Timezone,
        required this.the8Currency,
        required this.the9MatchScore,
    });

    factory BestMatch.fromJson(Map<String, dynamic> json) => BestMatch(
        the1Symbol: json["1. symbol"],
        the2Name: json["2. name"],
        the3Type: json["3. type"],
        the4Region: json["4. region"],
        the5MarketOpen: json["5. marketOpen"],
        the6MarketClose: json["6. marketClose"],
        the7Timezone: json["7. timezone"],
        the8Currency: json["8. currency"],
        the9MatchScore: json["9. matchScore"],
    );

    Map<String, dynamic> toJson() => {
        "1. symbol": the1Symbol,
        "2. name": the2Name,
        "3. type": the3Type,
        "4. region": the4Region,
        "5. marketOpen": the5MarketOpen,
        "6. marketClose": the6MarketClose,
        "7. timezone": the7Timezone,
        "8. currency": the8Currency,
        "9. matchScore": the9MatchScore,
    };
}
