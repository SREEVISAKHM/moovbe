import 'package:flutter/material.dart';
import 'package:moovbe/utils/extension.dart';
import 'package:moovbe/utils/size_config.dart';

import '../../../utils/colors.dart';

class HomeScreenListTile extends StatelessWidget {
  const HomeScreenListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.blockSizeVertical! * 9.86,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius:
              BorderRadius.circular(SizeConfig.blockSizeVertical! * 1.33),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal! * 20.25,
              height: SizeConfig.blockSizeVertical! * 9.73,
              color: colorF3F3F3,
              child: Center(child: Image.asset('bus2'.asAssetImagePng())),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KSRTC',
                  style: TextStyle(
                      fontFamily: 'auxiforma',
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                ),
                Text(
                  'Swift Scania P-series',
                  style: TextStyle(
                      fontFamily: 'auxiforma',
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  color: colorRed,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 1),
                ),
                child: Center(
                  child: Text(
                    'Manage',
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: 'auxiforma',
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
