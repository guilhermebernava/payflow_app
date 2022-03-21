import 'package:flutter/material.dart';

import '../dividerVertical/dividerVertical.dart';
import '../labelButton/labelButton.dart';

class SetLabelButtons extends StatelessWidget {
  final String primary;
  final String secundary;
  final VoidCallback primaryOnPressed;
  final VoidCallback secundaryOnPressed;

  const SetLabelButtons(
      {Key? key,
      required this.primary,
      required this.secundary,
      required this.primaryOnPressed,
      required this.secundaryOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primary,
              onPressed: primaryOnPressed,
            ),
          ),
          DividerVertical(),
          Expanded(
              child:
                  LabelButton(label: secundary, onPressed: secundaryOnPressed))
        ],
      ),
    );
  }
}
