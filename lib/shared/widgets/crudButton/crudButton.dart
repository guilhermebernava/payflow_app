import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

class CrudButton extends StatelessWidget {
  final void Function() onView;
  const CrudButton({Key? key, required this.onView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                textStyle: TextStyles.buttonBoldGray,
                value: Icons.ac_unit,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.visibility),
                  ),
                  SimpleDialogOption(
                    onPressed: onView,
                    child: Text('Visualizar'),
                  )
                ]),
              ),
              PopupMenuItem(
                textStyle: TextStyles.buttonBoldGray,
                value: Icons.ac_unit,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.edit),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Editar'),
                  )
                ]),
              ),
              PopupMenuItem(
                textStyle: TextStyles.buttonBoldGray,
                value: Icons.ac_unit,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.delete),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Deletar'),
                  )
                ]),
              ),
            ]);
  }
}
