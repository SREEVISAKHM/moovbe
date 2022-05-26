import 'package:flutter/material.dart';
import 'package:moovbe/utils/extension.dart';
import 'package:moovbe/utils/size_config.dart';

import '../../../utils/colors.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 40,
      width: SizeConfig.safeBlockHorizontal! * 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'welcome banner'.asAssetImagePng(),
            fit: BoxFit.fill,
          ),
          Positioned(
              left: SizeConfig.safeBlockHorizontal! * 10,
              top: SizeConfig.safeBlockVertical! * 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: 'axiforma',
                      fontSize: SizeConfig.safeBlockHorizontal! * 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Manage your Bus and Drivers',
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: 'axiforma',
                      fontSize: SizeConfig.safeBlockHorizontal! * 5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
