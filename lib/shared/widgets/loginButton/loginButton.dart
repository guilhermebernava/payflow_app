import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

class LoginButton extends StatelessWidget {
  //serve para quando clicar no botao algo ocorrer
  final VoidCallback onTap;
  final String textButton;
  final String image;

  const LoginButton(
      {Key? key,
      required this.onTap,
      required this.textButton,
      required this.image})
      : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Image.asset(image),
                ),
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
                textButton,
                style: TextStyles.buttonGray,
              )
            ]),
          )
        ]),
      ),
    );
  }
}
