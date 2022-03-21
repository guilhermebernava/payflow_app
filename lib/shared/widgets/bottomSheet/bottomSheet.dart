import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/widgets/setLabelButtons/setLabelButtons.dart';

import '../../themes/textStyles.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primary;
  final String secundary;
  final VoidCallback primaryOnPressed;
  final VoidCallback secundaryOnPressed;
  final String title;
  final String subtitle;

  const BottomSheetWidget(
      {Key? key,
      required this.primary,
      required this.secundary,
      required this.primaryOnPressed,
      required this.secundaryOnPressed,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColor.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                                text: "\n $subtitle",
                                style: TextStyles.buttonHeading)
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(height: 1, color: AppColor.stroke),
                    SetLabelButtons(
                        primary: primary,
                        secundary: secundary,
                        primaryOnPressed: primaryOnPressed,
                        secundaryOnPressed: secundaryOnPressed)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
