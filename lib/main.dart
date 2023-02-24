import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:postislemiriverpood/views/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.indigo,
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        primaryColor: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.orange),
        fontFamily: 'Bradley Hand',
        primaryColorDark: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }
}
