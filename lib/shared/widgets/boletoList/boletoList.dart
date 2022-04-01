import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:payflow_2/shared/widgets/boletoList/boletoListController.dart';
import 'package:payflow_2/shared/widgets/boletoWidget/BoletoWidget.dart';

class BoletoList extends StatefulWidget {
  final BoletoListController controller;
  const BoletoList({Key? key, required this.controller}) : super(key: key);

  @override
  State<BoletoList> createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: ValueListenableBuilder<List<BoletoModel>>(
          valueListenable: widget.controller.boletosNotifier,
          builder: (_, boletos, __) => Column(
                children: boletos.map((e) => BoletoWidget(model: e)).toList(),
              )),
    );
  }
}
