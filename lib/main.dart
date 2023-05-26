import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stock_watchlist/presentation/splash_screen.dart';
import 'domain/watchlist/model/watchlist_class.dart';

late MediaQueryData myMediaQueryData;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myMediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  await Hive.initFlutter();
  runApp(const MyApp());
  Hive.registerAdapter(DetailsAdapter());
  await openBox();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
