import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moovbe/features/home/screen/home_screen.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/extension.dart';

import '../../auth/screen/login.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _isLoggedIn() async {
    Future.delayed(const Duration(milliseconds: 60));
    return false;
  }

  void _initState() async {
    bool isLoggedIn = false;

    try {
      isLoggedIn = await _isLoggedIn();
    } catch (e) {
      log('Error: $e');
    } finally {
      if (isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.route);
      } else {
        Navigator.of(context).pushReplacementNamed(Login.route);
      }
    }
  }

  @override
  void initState() {
    _initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorRed,
        child: Center(
          child: Image(
            image: AssetImage('logo'.asAssetImagePng()),
          ),
        ),
      ),
    );
  }
}
