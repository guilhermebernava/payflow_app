import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';
import '../boletoModal/boletoModal.dart';
import '../crudButton/crudButton.dart';

class BoletoWidget extends StatelessWidget {
  final BoletoModel model;
  const BoletoWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
        direction: AnimatedCardDirection.bottom,
        child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              model.name!,
              style: TextStyles.titleListTile,
            ),
            subtitle: Text.rich(
              TextSpan(
                  text: "R\$ ",
                  style: TextStyles.trailingRegular,
                  children: [
                    TextSpan(
                        text: "${model.value!.toStringAsFixed(2)}",
                        style: TextStyles.trailingBold)
                  ]),
            ),
            trailing: CrudButton(
              onView: () {
                Navigator.pop(context, true);
                showCupertinoModalPopup(
                    context: context,
                    builder: (builder) {
                      return BoletoModal(modal: model);
                    });
                return;
              },
            )));
  }
}
