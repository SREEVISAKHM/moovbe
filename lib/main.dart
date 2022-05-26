import 'package:flutter/material.dart';
import 'package:moovbe/features/splash_screen/screen/splash_screen.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoovBe',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0, color: color2a2a2a)),
      routes: appRoutes(),
      onGenerateRoute: onAppGenerateRoute(),
      initialRoute: SplashScreen.route,
    );
  }
}
