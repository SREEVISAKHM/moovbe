import 'package:flutter/material.dart';
import 'package:moovbe/features/home/screen/home_screen.dart';
import 'package:moovbe/utils/colors.dart';
import 'package:moovbe/utils/size_config.dart';

import '../../../widgets/custom_text_field.dart';
import '../widgets/login_banner.dart';

class Login extends StatefulWidget {
  static const String route = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoginClicked = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoginBanner(),
              Expanded(
                flex: 8,
                child: Form(
                    key: _keyForm,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextFormField(
                          hintText: 'Enter Username',
                          controller: usernameController,
                          onChanged: (value) {
                            _keyForm.currentState!.validate();
                          },
                          validator: (value) {
                            if (!_isLoginClicked) {
                              return null;
                            }
                            if (value?.trim().isEmpty ?? true) {
                              return "User Name is required.";
                            }
                            return null;
                          },
                        ),
                        height(SizeConfig.blockSizeVertical! * 2),
                        CustomTextFormField(
                          hintText: 'Enter Password',
                          controller: passwordController,
                          onChanged: (value) {
                            _keyForm.currentState!.validate();
                          },
                          validator: (value) {
                            if (!_isLoginClicked) {
                              return null;
                            }
                            if (value?.trim().isEmpty ?? true) {
                              return "Password is required.";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    _isLoginClicked = true;
                    if (_keyForm.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, HomeScreen.route);
                    }
                  },
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal! * 85,
                    decoration: BoxDecoration(
                        color: colorRed,
                        borderRadius: BorderRadius.circular(
                            SizeConfig.blockSizeHorizontal! * 1.8)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: colorWhite,
                            fontFamily: 'axiforma',
                            fontSize: SizeConfig.blockSizeHorizontal! * 4.5),
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

  SizedBox height(double height) => SizedBox(
        height: height,
      );
}
