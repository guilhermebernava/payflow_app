import 'package:flutter/material.dart';

import '../dividerVertical/dividerVertical.dart';
import '../labelButton/labelButton.dart';

class SetLabelButtons extends StatelessWidget {
  final String primary;
  final String secundary;
  final VoidCallback primaryOnPressed;
  final VoidCallback secundaryOnPressed;
  final bool secundaryColor;
  final bool primaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primary,
    required this.secundary,
    required this.primaryOnPressed,
    required this.secundaryOnPressed,
    this.secundaryColor = false,
    this.primaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Container(
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
                child: LabelButton(
                    label: secundary, onPressed: secundaryOnPressed))
          ],
        ),
      ),
    );
  }
}
