import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/appImages.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

class LoginButton extends StatelessWidget {
  //serve para quando clicar no botao algo ocorrer
  final VoidCallback onTap;

  const LoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.08,
        decoration: BoxDecoration(
            color: AppColor.shape,
            border: Border.fromBorderSide(BorderSide(color: AppColor.stroke)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Expanded(
              flex: 1,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(AppImages.google),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  width: 1,
                  color: AppColor.stroke,
                )
              ])),
          Expanded(
            flex: 4,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Entrar com Google",
                style: TextStyles.buttonGray,
              )
            ]),
          )
        ]),
      ),
    );
  }
}
