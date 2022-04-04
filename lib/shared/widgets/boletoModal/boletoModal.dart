import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow_2/shared/widgets/labelButton/labelButton.dart';
import '../../Models/boletoModel.dart';
import '../../themes/appColor.dart';
import '../../themes/textStyles.dart';

class BoletoModal extends StatelessWidget {
  final BoletoModel modal;
  const BoletoModal({Key? key, required this.modal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.bottom,
      child: Scaffold(
        backgroundColor: AppColor.stroke,
        body: Center(
          child: Container(
              padding: EdgeInsets.all(30.0),
              width: 350,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.background),
              child: Column(
                children: [
                  Text(
                    "Nome do boleto: ${modal.name!}",
                    style: TextStyles.titleHome,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Valor: R\$ ${modal.value}",
                      style: TextStyles.titleBoldHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Data: ${modal.dueDate}",
                      style: TextStyles.titleBoldHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Número do Boleto: ${modal.barcode}",
                      style: TextStyles.titleBoldHeading,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Fechar",
                  style: TextStyles.buttonBoldBackground,
                )),
          ),
        ),
      ),
    );
  }
}
