import 'package:flutter/material.dart';
import 'package:payflow_2/modules/login/login.dart';
import 'package:payflow_2/modules/splash/splash.dart';
import 'package:payflow_2/shared/themes/appColor.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(primaryColor: AppColor.primary),
      initialRoute: "/splash",
      home: Login(),
    );
  }
}
