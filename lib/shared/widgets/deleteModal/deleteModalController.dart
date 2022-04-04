import 'package:payflow_2/shared/Models/boletoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteModalController {
  void onDelete(BoletoModel modal) async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList('boletos') ?? <String>[];

    boletos.remove(modal.toJson());
    await instance.setStringList("boletos", boletos);
  }
}
