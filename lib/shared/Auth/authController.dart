import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/home/home.dart';
import '../../modules/login/login.dart';
import '../Models/userModel.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      //NAVIGATOR serve para DIRECIONAR O USUARIO para HOME
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      //NAVIGATOR serve para DIRECIONAR O USUARIO para LOGIN
      //caso ele não esteja LOGADO
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return;
    } else {
      setUser(context, null);
    }
  }
}
