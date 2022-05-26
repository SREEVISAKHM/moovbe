import 'package:flutter/material.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/extension.dart';
import 'package:moovbe/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(SizeConfig.blockSizeHorizontal! * 100,
            SizeConfig.blockSizeVertical! * 15),
        child: Container(
            height: SizeConfig.blockSizeVertical! * 15,
            width: SizeConfig.blockSizeHorizontal! * 100,
            color: color2a2a2a,
            padding: const EdgeInsets.only(top: 10),
            child: Align(
              child: SizedBox(
                height: SizeConfig.blockSizeVertical! * 15,
                width: SizeConfig.blockSizeHorizontal! * 40,
                child: Image.asset(
                  'logo'.asAssetImagePng(),
                ),
              ),
            )),
      ),
    );
  }
}
