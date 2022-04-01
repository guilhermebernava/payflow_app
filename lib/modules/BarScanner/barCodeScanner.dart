import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

import '../../shared/widgets/bottomSheet/bottomSheet.dart';
import '../../shared/widgets/setLabelButtons/setLabelButtons.dart';
import 'barCodeScanner_controller.dart';
import 'barCodeScanner_status.dart';

class BarCodeScanner extends StatefulWidget {
  const BarCodeScanner({Key? key}) : super(key: key);

  @override
  State<BarCodeScanner> createState() => _BarCodeScannerState();
}

class _BarCodeScannerState extends State<BarCodeScanner> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insertBoleto",
            arguments: controller.status.barcode);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Escaneie o código de barras do boleto",
                      style: TextStyles.buttonBackground,
                    ),
                  ),
                  leading: BackButton(
                    color: AppColor.background,
                  ),
                  backgroundColor: Colors.black,
                ),
                body: Column(children: [
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  ))
                ]),
                bottomNavigationBar: SetLabelButtons(
                  primary: "Inserir código do boleto",
                  primaryOnPressed: () {},
                  secundary: "Adicionar da Galeria",
                  secundaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return Align(
                      alignment: Alignment.bottomLeft,
                      child: BottomSheetWidget(
                          primary: "Escanear novamente",
                          primaryOnPressed: () {
                            controller.getAvailableCameras();
                          },
                          secundary: "Digitar código",
                          secundaryOnPressed: () {
                            Navigator.pushReplacementNamed(
                                context, "/insertBoleto");
                          },
                          title:
                              "Não foi possível identificar um código de barras.",
                          subtitle:
                              "Tente escanear novamente ou digite o código do seu boleto."));
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
