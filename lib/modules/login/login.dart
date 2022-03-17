import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/appImages.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';
import 'package:payflow_2/shared/widgets/loginButton/loginButton.dart';

import 'loginController.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: AppColor.background,
        child: Stack(
          children: [
            SizedBox(
              child: Container(
                height: size.height * 0.35,
                color: AppColor.primary,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: size.height * 0.1,
              child: Image.asset(
                AppImages.person,
                height: size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                right: 0,
                left: 0,
                top: size.height * 0.55,
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.logomini,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 70, right: 70),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        textAlign: TextAlign.center,
                        style: TextStyles.titleHome,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 50, right: 50),
                      child: LoginButton(
                        onTap: () {
                          controller.googleSignIn(context);
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
