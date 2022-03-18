import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/userModel.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      //NAVIGATOR serve para DIRECIONAR O USUARIO para HOME
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      //NAVIGATOR serve para DIRECIONAR O USUARIO para LOGIN
      //caso ele não esteja LOGADO
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    //pega a instancia desse espaço dentro da memoria do celular
    //esse o local que podemos armazenar dados do usuario dentro do celular
    final instance = await SharedPreferences.getInstance();
    //está criando um USER dentro da instancia do SHAREDPREFERENCES dentro
    //da memoria do CELULAR.
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    //pega o SHARED_PREFERENCES do celular
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    //checa se ja existe algum usuario logado
    if (instance.containsKey("user")) {
      //pega informações do usuario dentro do SHARED
      final json = instance.get("user") as String;
      //coloca o USER dentro da MODEL
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
