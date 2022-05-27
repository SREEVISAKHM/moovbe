import 'package:flutter/material.dart';
import 'package:moovbe/features/driver_list/provider/driver_list_provider.dart';
import 'package:moovbe/features/driver_list/screen/add_driver_screen.dart';
import 'package:moovbe/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../widgets/driver_screen_list_tile.dart';

class DriverListScreen extends StatefulWidget {
  static const String route = '/driver_list';
  const DriverListScreen({Key? key}) : super(key: key);

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DriverListProvider>(context, listen: false)
          .fetchDriverListData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DriverListProvider driverListProvider =
        Provider.of<DriverListProvider>(context);

    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Driver List',
          style: TextStyle(
              fontFamily: 'axiforma',
              fontSize: SizeConfig.blockSizeHorizontal! * 4),
        ),
      ),
      body: driverListProvider.isLoading == true
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
                      '${driverListProvider.driverListModel!.driverList.length} Driver Found',
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
                            itemCount: driverListProvider
                                .driverListModel!.driverList.length,
                            itemBuilder: (_, index) {
                              return DriverScreenListTile(
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
                          Navigator.pushNamed(context, AddDriverScreen.route);
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
                                'Add Driver',
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
