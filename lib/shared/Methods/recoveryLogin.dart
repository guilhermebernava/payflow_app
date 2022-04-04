import 'package:flutter/material.dart';
import 'package:payflow_2/shared/Models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/home/home.dart';

class RecoveryLogin {
  Future<UserModel> recoveryUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    final userJson = await instance.getString("user");
    final user = UserModel.fromJson(userJson!);
    return user;
  }

  void backToHome(BuildContext context, UserModel user) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => Home(user: user),
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 450),
      ),
    );
  }
}
