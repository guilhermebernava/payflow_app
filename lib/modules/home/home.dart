import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow_2/modules/boletosPage/boletosPage.dart';
import 'package:payflow_2/modules/home/homeController.dart';
import 'package:payflow_2/modules/resumePage/resumePage.dart';
import 'package:payflow_2/shared/Auth/authController.dart';
import 'package:payflow_2/shared/Models/userModel.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';
import '../../shared/Models/boletoModel.dart';
import '../../shared/widgets/boletoList/boletoListController.dart';
import '../login/loginController.dart';

class Home extends StatefulWidget {
  final UserModel user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AuthController();
  final controller = HomeController();
  final loginController = LoginController();
  final boletoController = BoletoListController();
  final pages = [
    BoletoPage(
      key: UniqueKey(),
    ),
    ResumePage(
      key: UniqueKey(),
    )
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
              onPressed: (() => loginController.SignOut(context)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: AnimatedCard(
                  direction: AnimatedCardDirection.bottom,
                  child: Text(
                    "Logout",
                    style: TextStyles.titleHome,
                  ),
                ),
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
          // nesse caso o FILHO ?? o pr??prio CENTER
          // ?? o PAI ?? o CONTAINER
          child: Center(
              //Usa se o ListTile para colocar v??rios TEXTOS e uma IMAGEM no
              //final do componente
              child: ListTile(
            //text.rich serve para receber varios TEXTSPANS dentro dele
            title: Text.rich(TextSpan(
                text: "Ol??, ",
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                      text: "${widget.user.name}",
                      style: TextStyles.buttonBoldBackground)
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
                      image: DecorationImage(
                          image: NetworkImage(widget.user.photoURL!)),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              );
            }),
          )),
        ),
      ),
      body: controller.currentPage == 0
          ? ValueListenableBuilder<List<BoletoModel>>(
              valueListenable: boletoController.boletosNotifier,
              builder: (_, boletos, __) => BoletoPage())
          : ResumePage(),

      //Barra de navega????o inferior
      //PADDING serve para adicionar espa??amento entre CONTAINERS
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
                  setState(() {
                    controller.setPage(0);
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: controller.currentPage == 0
                      ? AppColor.primary
                      : AppColor.body,
                )),
            //Botao para usar o ONTAP
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, "/barCodeScanner");
                setState(() {});
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
                  setState(() {
                    controller.setPage(1);
                  });
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: controller.currentPage == 1
                      ? AppColor.primary
                      : AppColor.body,
                ))
          ]),
        ),
      ),
    );
  }
}
