import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoEditController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();
  BoletoModel oldModel = BoletoModel();

  //validações sobre os INPUTS
  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({String? name, String? barcode, String? date, double? value}) {
    model = model.copyWith(
        name: name, dueDate: date, value: value, barcode: barcode);
  }

  Future<void> SaveBoleto() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final boletos = instance.getStringList('boletos') ?? <String>[];

      final boleto = boletos.firstWhere((e) => e == model.toJson());

      boletos.add(model.toJson());
      await instance.setStringList("boletos", boletos);
      return;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> CadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await SaveBoleto();
      return true;
    }

    return false;
  }
}
