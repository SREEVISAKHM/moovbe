import 'package:flutter/material.dart';
import 'package:moovbe/features/driver_list/provider/driver_list_provider.dart';
import 'package:moovbe/features/home/provider/home_provider.dart';
import 'package:moovbe/features/splash_screen/screen/splash_screen.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/routes.dart';
import 'package:provider/provider.dart';

import 'features/auth/provider/login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DriverListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MoovBe',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0, color: color2a2a2a)),
        routes: appRoutes(),
        onGenerateRoute: onAppGenerateRoute(),
        initialRoute: SplashScreen.route,
      ),
    );
  }
}
