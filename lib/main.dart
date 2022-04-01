import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow_2/appWidget.dart';

//start up do codigo dart
void main() {
  runApp(AppFirebase());
}

// STATEFULL WIDGET
class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  //future é uma function ASYNC
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    //isso é o visual, tudo dentro do return é visual do APP
    return FutureBuilder(
        //vai inacializar o FIREBASE
        future: _initialization,
        //vai checar o firebase iniciou e se sim vai mostrar a tela inicial do app
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            //retorna o Visual do APP
            return AppWidget();
          } else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
