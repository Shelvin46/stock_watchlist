import 'package:hive/hive.dart';
part 'watchlist_class.g.dart';

@HiveType(typeId: 0)
class Details {
  @HiveField(0)
  String companyName;
  @HiveField(1)
  String matchScore;
  Details({required this.companyName, required this.matchScore});
  static Future<void> addingDetails(
    String companyName,
    String matchScore,
  ) async {
    final data = Details(
      companyName: companyName,
      matchScore: matchScore,
    );
    await model.add(data);
  }
}

late Box<Details> model;
openBox() async {
  model = await Hive.openBox('events');
}
