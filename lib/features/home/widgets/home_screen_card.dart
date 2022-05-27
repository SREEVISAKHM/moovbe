import 'package:flutter/material.dart';
import 'package:moovbe/utils/extension.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_config.dart';

class HomeScreenCard extends StatelessWidget {
  final String imageName, title1, title2;
  final Color color;
  final double right, bottom;
  const HomeScreenCard({
    Key? key,
    required this.imageName,
    required this.title1,
    required this.title2,
    required this.color,
    required this.right,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      children: [
        Container(
          width: SizeConfig.blockSizeHorizontal! * 40.5,
          height: SizeConfig.blockSizeVertical! * 23.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        Positioned(
          top: 5,
          left: 8,
          child: Text(
            title1,
            style: TextStyle(
                color: colorWhite,
                fontFamily: 'axiforma',
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockSizeHorizontal! * 8),
          ),
        ),
        Positioned(
          top: 50,
          left: 8,
          child: Text(
            title2,
            style: TextStyle(
                color: colorWhite,
                fontFamily: 'axiforma',
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockSizeHorizontal! * 3),
          ),
        ),
        Positioned(
          bottom: bottom,
          right: right,
          child: SizedBox(
            height: SizeConfig.blockSizeHorizontal! * 26.15,
            child: Image.asset(
              imageName.asAssetImagePng(),
            ),
          ),
        ),
      ],
    );
  }
}
