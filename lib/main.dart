import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:stock_watchlist/application/home/bloc/idle_and_search_bloc.dart';
import 'package:stock_watchlist/application/watchlist/for_watchlist/watchlist_showing_bloc.dart';
import 'package:stock_watchlist/presentation/splash_screen.dart';
import 'domain/watchlist/model/watchlist_class.dart';

late MediaQueryData myMediaQueryData;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myMediaQueryData = MediaQueryData.fromView(WidgetsBinding.instance.window);
  await Hive.initFlutter();
  runApp(const MyApp());
  Hive.registerAdapter(DetailsAdapter());
  await openBox();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return IdleAndSearchBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return WatchlistShowingBloc();
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
