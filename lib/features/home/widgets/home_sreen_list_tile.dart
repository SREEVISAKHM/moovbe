import 'package:flutter/material.dart';
import 'package:moovbe/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../provider/home_provider.dart';

class HomeScreenListTile extends StatelessWidget {
  final int index;
  const HomeScreenListTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    var data = homeProvider.homeScreenModel?.busList[index];

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
              // child: Center(child: Image.asset('bus2'.asAssetImagePng())),

              child: Center(
                child: Image.network(
                  'https://www.freeiconspng.com/thumbs/bus-png/bus-png-4.png',
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ), // Text(
            //   'Swift Scania P-series',
            //   style: TextStyle(
            //       fontFamily: 'auxiforma',
            //       fontSize: SizeConfig.blockSizeHorizontal! * 4),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: SizeConfig.blockSizeHorizontal! * 40,
                child: Text(
                  data?.name ?? '',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'auxiforma',
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                ),
              ),
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
