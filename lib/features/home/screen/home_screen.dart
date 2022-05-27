import 'package:flutter/material.dart';
import 'package:moovbe/features/bus_seats.dart/screen/bus_seats_screen.dart';
import 'package:moovbe/features/driver_list/screen/driver_list_screen.dart';
import 'package:moovbe/features/home/provider/home_provider.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/extension.dart';
import 'package:moovbe/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen_card.dart';
import '../widgets/home_sreen_list_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).fetchHomeScreenData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
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
          ),
        ),
      ),
      body: homeProvider.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    height(SizeConfig.blockSizeVertical! * 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HomeScreenCard(
                          imageName: 'bus',
                          title1: 'Bus',
                          title2: "Manage your Bus",
                          color: colorRed,
                          right: 0,
                          bottom: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, DriverListScreen.route);
                          },
                          child: const HomeScreenCard(
                            imageName: 'driver',
                            title1: 'Driver',
                            title2: "Manage your Driver",
                            color: color2a2a2a,
                            right: 10,
                            bottom: 0,
                          ),
                        ),
                      ],
                    ),
                    height(SizeConfig.blockSizeVertical! * 3),
                    Text(
                      '${homeProvider.homeScreenModel?.busList.length} Buses Found',
                      style: const TextStyle(
                        fontFamily: 'Axiforma',
                        fontSize: 13,
                        color: Color.fromRGBO(107, 107, 107, 1),
                      ),
                    ),
                    height(SizeConfig.blockSizeVertical! * 3),
                    Flexible(
                      child: SizedBox(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount:
                                homeProvider.homeScreenModel?.busList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, BusSeatsScreen.route,
                                        arguments:
                                            BusSeatsScreen(index: index));
                                  },
                                  child: HomeScreenListTile(
                                    index: index,
                                  ));
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  SizedBox height(double value) => SizedBox(height: value);
}
