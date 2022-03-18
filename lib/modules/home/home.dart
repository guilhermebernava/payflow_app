import 'package:flutter/material.dart';
import 'package:payflow_2/modules/home/homeController.dart';
import 'package:payflow_2/shared/Auth/authController.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

import '../../shared/Models/userModel.dart';
import '../login/loginController.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AuthController();
  final controller = HomeController();
  final loginController = LoginController();
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //precisa passar o PREFERREDSIZE pois appbar nn recebe WIDGET
      //diretamente, mas o PREFERRED aceita CHILD.
      drawer: new Drawer(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Center(
                child: TextButton(
              onPressed: (() async => {await loginController.SignOut(context)}),
              child: Text(
                "Logout",
                style: TextStyles.titleHome,
              ),
            )),
          )
        ],
      )),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: size.height * 0.20,
          color: AppColor.primary,
          //Ele centraliza o componente FILHO dentro do seu PAI
          // nesse caso o FILHO é o próprio CENTER
          // é o PAI é o CONTAINER
          child: Center(
              //Usa se o ListTile para colocar vários TEXTOS e uma IMAGEM no
              //final do componente
              child: ListTile(
            //text.rich serve para receber varios TEXTSPANS dentro dele
            title: Text.rich(TextSpan(
                text: "Olá, ",
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                      text: "Guilherme", style: TextStyles.buttonBoldBackground)
                ])),
            //TITULO QUE VAI EMBAIXO DA TEXTO PRINCIPAL
            subtitle: Text(
              "Mantenha suas contas em dia",
              style: TextStyles.captionShape,
            ),
            //FINAL DO COMPONENTE imagem do usuario
            //serve para passar contexto para os WIDGETS
            trailing: Builder(builder: (context) {
              return GestureDetector(
                onTap: () => {Scaffold.of(context).openDrawer()},
                child: Container(
                  height: size.height,
                  width: size.width * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              );
            }),
          )),
        ),
      ),
      body: pages[controller.currentPage],
      //Barra de navegação inferior
      //PADDING serve para adicionar espaçamento entre CONTAINERS
      bottomNavigationBar: Padding(
        //colocando o padding em cada lugar
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          color: AppColor.background,
          height: size.height * 0.1,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //Botao para navegar utilizando ICONES e PRESSIONAR
            IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: AppColor.primary,
                )),
            //Botao para usar o ONTAP
            GestureDetector(
              onTap: () {
                print("Clicou");
              },
              child: Container(
                width: size.width * 0.18,
                height: size.width * 0.18,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  size: 42,
                  color: AppColor.background,
                ),
              ),
            ),
            //Botao para navegar entre as telas
            IconButton(
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: AppColor.body,
                ))
          ]),
        ),
      ),
    );
  }
}
