import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:payflow_2/shared/widgets/boletoList/boletoList.dart';
import 'package:payflow_2/shared/widgets/boletoList/boletoListController.dart';

import '../../shared/themes/appColor.dart';
import '../../shared/themes/textStyles.dart';

class BoletoPage extends StatefulWidget {
  BoletoPage({Key? key}) : super(key: key);

  @override
  State<BoletoPage> createState() => _BoletoPageState();
}

class _BoletoPageState extends State<BoletoPage> {
  final controller = BoletoListController();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meus Boletos",
                    style: TextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                  ValueListenableBuilder<List<BoletoModel>>(
                      valueListenable: controller.boletosNotifier,
                      builder: (_, boletos, __) => Text(
                            "Você tem ${boletos.length} boletos",
                            style: TextStyles.input,
                            textAlign: TextAlign.center,
                          ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              color: AppColor.stroke,
              thickness: 1,
              height: 1,
            ),
          ),
          BoletoList(
            controller: controller,
          )
        ],
      ),
    );
  }
}
