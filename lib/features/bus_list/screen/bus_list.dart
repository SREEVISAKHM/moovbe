import 'package:flutter/material.dart';
import 'package:moovbe/features/bus_list/screen/assign_driver.dart';
import 'package:moovbe/features/bus_list/widgets/bus_screen_list_tile.dart';

import 'package:moovbe/features/home/provider/home_provider.dart';
import 'package:moovbe/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';

class BusListScreen extends StatefulWidget {
  static const String route = '/bus_list';
  const BusListScreen({Key? key}) : super(key: key);

  @override
  State<BusListScreen> createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bus List',
          style: TextStyle(
              fontFamily: 'axiforma',
              fontSize: SizeConfig.blockSizeHorizontal! * 4),
        ),
      ),
      body: homeProvider.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    height(SizeConfig.blockSizeVertical! * 3),
                    Text(
                      '${homeProvider.homeScreenModel!.busList.length} Driver Found',
                      style: TextStyle(
                        fontFamily: 'Axiforma',
                        fontSize: SizeConfig.blockSizeVertical! * 2,
                        color: const Color.fromRGBO(107, 107, 107, 1),
                      ),
                    ),
                    height(SizeConfig.blockSizeVertical! * 3),
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                homeProvider.homeScreenModel!.busList.length,
                            itemBuilder: (_, index) {
                              return BusScreenListTile(
                                index: index,
                              );
                            }),
                      ),
                    ),
                    height(SizeConfig.blockSizeVertical! * 3),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AssignDriverScreen.route);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: SizeConfig.safeBlockHorizontal! * 85,
                            decoration: BoxDecoration(
                                color: colorRed,
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.blockSizeHorizontal! * 1.8)),
                            child: Center(
                              child: Text(
                                'Assign Driver',
                                style: TextStyle(
                                    color: colorWhite,
                                    fontFamily: 'axiforma',
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 4.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    height(SizeConfig.blockSizeVertical! * 2),
                  ],
                ),
              ),
            ),
    );
  }

  SizedBox height(double value) => SizedBox(height: value);
}
