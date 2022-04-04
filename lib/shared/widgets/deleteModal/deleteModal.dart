import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:payflow_2/shared/widgets/boletoList/boletoListController.dart';
import 'package:payflow_2/shared/widgets/deleteModal/deleteModalController.dart';
import '../../Methods/recoveryLogin.dart';
import '../../themes/textStyles.dart';

class DeleteModal extends StatefulWidget {
  final BoletoModel modal;
  const DeleteModal({Key? key, required this.modal}) : super(key: key);

  @override
  State<DeleteModal> createState() => _DeleteModalState();
}

class _DeleteModalState extends State<DeleteModal> {
  final recoverUser = RecoveryLogin();
  final controllerList = BoletoListController();
  final controller = DeleteModalController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text.rich(TextSpan(
          text: "Deletar o:\n",
          style: TextStyles.titleHome,
          children: [
            TextSpan(
                text: "${widget.modal.name}",
                style: TextStyles.titleBoldHeading)
          ])),
      content:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Fechar",
              style: TextStyles.buttonBoldBackground,
            )),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 176, 39, 39),
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            onPressed: () async {
              controller.onDelete(widget.modal);
              final user = await recoverUser.recoveryUser(context);
              recoverUser.backToHome(context, user);
            },
            child: Text(
              "Deletar",
              style: TextStyles.buttonBoldBackground,
            ))
      ]),
    );
  }
}
