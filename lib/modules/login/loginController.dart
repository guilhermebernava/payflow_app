import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../shared/Auth/authController.dart';
import '../../shared/Models/userModel.dart';

//controler para fazer LOGIN COM O GOOGLE
class LoginController {
  final authController = AuthController();
  //vai devolver uma PROMISE e vai receber um CONTEXTO
  Future<void> googleSignIn(BuildContext context) async {
    //vai retornar o email do usuario
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      //vai logar no google
      final response = await _googleSignIn.signIn();
      //vai pegar as informações do usuarios
      final user = UserModel(
        name: response!.displayName!,
        photoURL: response.photoUrl,
      );
      //vai colocar as USERS dentro de uma variavel
      authController.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
