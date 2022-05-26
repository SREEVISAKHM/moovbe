import 'package:flutter/cupertino.dart';
import 'package:moovbe/features/auth/screen/login.dart';
import 'package:moovbe/features/home/screen/home_screen.dart';
import 'package:moovbe/features/splash_screen/screen/splash_screen.dart';

//routes for the application
Map<String, Widget Function(BuildContext context)> appRoutes() => {
      SplashScreen.route: (context) => const SplashScreen(),
      Login.route: (context) => const Login(),
      HomeScreen.route: ((context) => const HomeScreen())
    };

//handle routes with consturctor parameters
RouteFactory onAppGenerateRoute() => (settings) {
      return null;
    };
