import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Auth/authController.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/appImages.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull))
        ],
      ),
    );
  }
}
