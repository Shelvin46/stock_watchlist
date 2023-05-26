import 'package:hive/hive.dart';
part 'watchlist_class.g.dart';

@HiveType(typeId: 0)
class Details {
  @HiveField(0)
  String companyName;
  @HiveField(1)
  String price;
  Details({required this.companyName, required this.price});
}

late Box<Details> model;
openBox() async {
  model = await Hive.openBox('events');
}
