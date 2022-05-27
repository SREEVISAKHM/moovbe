import 'package:flutter/material.dart';
import 'package:moovbe/features/bus_list/provider/bus_list_provider.dart';
import 'package:moovbe/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../widgets/custom_text_field.dart';

class AssignDriverScreen extends StatefulWidget {
  static const String route = '/assign_driver';
  const AssignDriverScreen({Key? key}) : super(key: key);

  @override
  State<AssignDriverScreen> createState() => _AssignDriverScreenState();
}

class _AssignDriverScreenState extends State<AssignDriverScreen> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController busIdController = TextEditingController();
  TextEditingController driverIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BusListProvider busListProvider = Provider.of<BusListProvider>(context);
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Assign Driver',
          style: TextStyle(
              fontFamily: 'axiforma',
              fontSize: SizeConfig.blockSizeHorizontal! * 4),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            height(SizeConfig.blockSizeVertical! * 10),
            Form(
              key: _keyForm,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    hintText: 'Enter Bus Id',
                    controller: busIdController,
                  ),
                  height(SizeConfig.blockSizeVertical! * 2),
                  CustomTextFormField(
                    hintText: 'Enter Driver Id',
                    controller: driverIdController,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20) +
            const EdgeInsets.symmetric(horizontal: 30),
        child: InkWell(
          onTap: () {
            if (_keyForm.currentState!.validate()) {
              busListProvider.assignDriver(
                busIdController.text,
                driverIdController.text,
              );
              Navigator.pop(context);
            }
          },
          child: SizedBox(
            width: double.maxFinite,
            height: SizeConfig.blockSizeVertical! * 7,
            child: Container(
              decoration: BoxDecoration(
                  color: colorRed,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 1.8)),
              child: Center(
                child: busListProvider.isLoading == true
                    ? const CircularProgressIndicator()
                    : Text(
                        'Save',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'axiforma',
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.5),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox height(double value) => SizedBox(
        height: value,
      );
}
