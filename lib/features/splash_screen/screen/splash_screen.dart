import 'package:flutter/material.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/extension.dart';

class SplashScreen extends StatelessWidget {
  static const String route = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

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
