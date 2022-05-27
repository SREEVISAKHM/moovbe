import 'package:flutter/material.dart';
import 'package:moovbe/features/bus_seats.dart/widgets/one_by_three.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/extension.dart';
import 'package:moovbe/utils/size_config.dart';

class BusSeatsScreen extends StatefulWidget {
  static const String route = '/bus_seats';
  const BusSeatsScreen({Key? key}) : super(key: key);

  @override
  State<BusSeatsScreen> createState() => _BusSeatsScreenState();
}

class _BusSeatsScreenState extends State<BusSeatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'KSRTC Swift Scania P-series',
          style: TextStyle(
              fontFamily: 'axiforma',
              fontSize: SizeConfig.blockSizeHorizontal! * 4),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 6),
        child: Column(
          children: [
            height(SizeConfig.blockSizeVertical! * 3.5),
            Container(
              width: SizeConfig.blockSizeHorizontal! * 85.89,
              height: SizeConfig.blockSizeVertical! * 15.28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color2a2a2a,
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Rohit sharma',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'axiforma',
                            fontSize: SizeConfig.blockSizeHorizontal! * 5),
                      ),
                      Text(
                        'License no: PJ515196161655',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'axiforma',
                            fontSize: SizeConfig.blockSizeHorizontal! * 3),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Image.asset('driver'.asAssetImagePng()),
                  )
                ],
              ),
            ),
            // height(SizeConfig.blockSizeVertical! * 3.5),
            // const TwoByTwo()
            height(SizeConfig.blockSizeVertical! * 3.5),
            const OneByThree()
          ],
        ),
      ),
    );
  }

  SizedBox height(double value) => SizedBox(height: value);
}
