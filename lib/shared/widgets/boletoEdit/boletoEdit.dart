import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:payflow_2/shared/widgets/boletoEdit/boletoEditController.dart';

import '../../themes/appColor.dart';
import '../../themes/textStyles.dart';
import '../inputBoleto/inputBoleto.dart';
import '../setLabelButtons/setLabelButtons.dart';

class BoletoEdit extends StatefulWidget {
  final BoletoModel model;
  BoletoEdit({Key? key, required this.model}) : super(key: key);

  @override
  State<BoletoEdit> createState() => _BoletoEditState();
}

class _BoletoEditState extends State<BoletoEdit> {
  final controller = BoletoEditController();

  final moneyValidator =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dateValidator = MaskedTextController(mask: "00/00/0000");

  final barcodeValidator = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColor.background,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 60.0, right: 60.0, bottom: 60),
                child: Center(
                  child: Text(
                    "Preencha os dados do boleto",
                    style: TextStyles.titleHome,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Form(
                  //KEY e uma forma de você conseguir acessar essa informação que foi digitada
                  //dentro das controllers para poder validar ou mesmo salvar essa informação.
                  key: controller.formKey,
                  child: Column(
                    children: [
                      InputBoleto(
                        placeHolder: "Nome do Boleto",
                        icon: Icons.description_outlined,
                        validator: controller.validateName,
                        onChanged: (value) {
                          controller.onChange(name: value);
                        },
                      ),
                      InputBoleto(
                        controller: dateValidator,
                        placeHolder: "Vencimento",
                        validator: controller.validateVencimento,
                        icon: FontAwesomeIcons.timesCircle,
                        onChanged: (value) {
                          controller.onChange(date: value);
                        },
                      ),
                      InputBoleto(
                        controller: moneyValidator,
                        placeHolder: "Valor",
                        validator: (_) => controller
                            .validateValor(moneyValidator.numberValue),
                        icon: FontAwesomeIcons.wallet,
                        onChanged: (value) {
                          controller.onChange(
                              value: moneyValidator.numberValue);
                        },
                      ),
                      InputBoleto(
                        controller: barcodeValidator,
                        placeHolder: "Código",
                        validator: controller.validateCodigo,
                        icon: FontAwesomeIcons.barcode,
                        onChanged: (value) {
                          controller.onChange(barcode: value);
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
          primary: "Cancelar",
          secundary: "Cadastrar",
          primaryOnPressed: () {
            Navigator.pop(context);
          },
          secundaryOnPressed: () async {
            final result = await controller.CadastrarBoleto();

            if (result == false) {
              await CoolAlert.show(
                context: context,
                type: CoolAlertType.warning,
                title: "Ops...",
                text: "Há erros nos dados do boleto,\ndigite-os novamente!",
                confirmBtnColor: Color.fromARGB(255, 255, 255, 0),
                confirmBtnText: "Tentar Novamente",
                confirmBtnTextStyle: TextStyles.buttonBoldHeading,
                loopAnimation: false,
                animType: CoolAlertAnimType.scale,
                backgroundColor: AppColor.background,
                autoCloseDuration: Duration(seconds: 5),
              );
              return;
            }
            await CoolAlert.show(
              context: context,
              type: CoolAlertType.success,
              title: "Sucess",
              text: "Salvou o boleto com sucesso!!!",
              confirmBtnColor: AppColor.primary,
              loopAnimation: false,
              animType: CoolAlertAnimType.scale,
              backgroundColor: AppColor.background,
              autoCloseDuration: Duration(seconds: 5),
            );
            Navigator.pop(context);
          }),
    );
  }
}
