import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow_2/modules/BarScanner/barCodeScanner.dart';
import 'package:payflow_2/modules/home/home.dart';
import 'package:payflow_2/modules/login/login.dart';
import 'package:payflow_2/modules/splash/splash.dart';
import 'package:payflow_2/shared/Models/userModel.dart';
import 'package:payflow_2/shared/themes/appColor.dart';

import 'modules/insertBoleto/insertBoleto.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: AppColor.primary),
      //TELA INICIAL
      initialRoute: "/splash",
      //ADICIONA ROTAS NOMEADAS PARA AS TELAS
      routes: {
        "/home": (context) => Home(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/splash": (context) => Splash(),
        "/login": (context) => Login(),
        "/barCodeScanner": (context) => BarCodeScanner(),
        "/insertBoleto": (context) => InsertBoleto()
      },
    );
  }
}
