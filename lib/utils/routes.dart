import 'package:flutter/cupertino.dart';
import 'package:moovbe/features/auth/screen/login.dart';
import 'package:moovbe/features/bus_seats.dart/screen/bus_seats_screen.dart';
import 'package:moovbe/features/driver_list/screen/add_driver_screen.dart';
import 'package:moovbe/features/driver_list/screen/driver_list_screen.dart';
import 'package:moovbe/features/home/screen/home_screen.dart';
import 'package:moovbe/features/splash_screen/screen/splash_screen.dart';

//routes for the application
Map<String, Widget Function(BuildContext context)> appRoutes() => {
      SplashScreen.route: (context) => const SplashScreen(),
      Login.route: (context) => const Login(),
      HomeScreen.route: (context) => const HomeScreen(),
      BusSeatsScreen.route: (context) => const BusSeatsScreen(),
      DriverListScreen.route: (context) => const DriverListScreen(),
      AddDriverScreen.route: (context) => const AddDriverScreen(),
    };

//handle routes with consturctor parameters
RouteFactory onAppGenerateRoute() => (settings) {
      return null;
    };
