import 'package:flutter/material.dart';
import 'package:moovbe/utils/size_config.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
      width: SizeConfig.safeBlockHorizontal! * 85,
      // height: SizeConfig.safeBlockVertical! * 7,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockSizeHorizontal! * 10,
                vertical: SizeConfig.blockSizeHorizontal! * 3),
            hintText: hintText,
            filled: true,
            fillColor: color2a2a2a.withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal! * 1.8)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal! * 1.8)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal! * 1.8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal! * 1.8)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal! * 1.8))),
      ),
    );
  }
}
