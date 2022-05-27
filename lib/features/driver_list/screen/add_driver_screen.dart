import 'package:flutter/material.dart';
import 'package:moovbe/utils/size_config.dart';

import '../../../utils/colors.dart';
import '../../../widgets/custom_text_field.dart';

class AddDriverScreen extends StatefulWidget {
  static const String route = '/add_driver';
  const AddDriverScreen({Key? key}) : super(key: key);

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController licenseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Driver',
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
                    hintText: 'Enter Name',
                    controller: nameController,
                  ),
                  height(SizeConfig.blockSizeVertical! * 2),
                  CustomTextFormField(
                    hintText: 'Enter License Number',
                    controller: licenseController,
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
          onTap: () {},
          child: SizedBox(
            width: double.maxFinite,
            height: SizeConfig.blockSizeVertical! * 7,
            child: Container(
              decoration: BoxDecoration(
                  color: colorRed,
                  borderRadius: BorderRadius.circular(
                      SizeConfig.blockSizeHorizontal! * 1.8)),
              child: Center(
                child: Text(
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
