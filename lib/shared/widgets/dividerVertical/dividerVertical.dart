import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';

class DividerVertical extends StatelessWidget {
  const DividerVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 1,
      color: AppColor.stroke,
    );
  }
}
