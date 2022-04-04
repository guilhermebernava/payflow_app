import 'package:flutter/material.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import '../../themes/textStyles.dart';

class InputBoleto extends StatelessWidget {
  final String placeHolder;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isNumber;
  final void Function(String value) onChanged;

  const InputBoleto(
      {Key? key,
      required this.placeHolder,
      required this.icon,
      this.validator,
      this.controller,
      this.isNumber = false,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            //onChanged é a function que te da acesso ao dado que está
            //sendo escrito pelo usuario, e nesse caso estamos passando
            //a responsabilidade de criar essa function por PROPS.
            onChanged: onChanged,
            style: TextStyles.input,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: placeHolder,
                labelStyle: TextStyles.input,
                border: InputBorder.none,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Icon(icon, color: AppColor.primary)),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColor.stroke,
                    )
                  ],
                )),
            //define o TIPO de TECLADO que vai aparecer para o usuario
            keyboardType:
                isNumber == true ? TextInputType.number : TextInputType.text,
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColor.stroke,
          )
        ],
      ),
    );
  }
}
