import 'package:flutter/material.dart';
import 'package:payflow_2/modules/home/homeController.dart';
import 'package:payflow_2/shared/themes/appColor.dart';
import 'package:payflow_2/shared/themes/textStyles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: size.height * 0.20,
          color: AppColor.primary,
          child: Center(
              child: ListTile(
            title: Text.rich(TextSpan(
                text: "Olá, ",
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                      text: "Guilherme", style: TextStyles.buttonBoldBackground)
                ])),
            subtitle: Text(
              "Mantenha suas contas em dia",
              style: TextStyles.captionShape,
            ),
            trailing: Container(
              height: size.height,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(5)),
            ),
          )),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          color: AppColor.background,
          height: size.height * 0.1,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: AppColor.primary,
                )),
            GestureDetector(
              onTap: () {
                print("Clicou");
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColor.background,
                ),
              ),
            ),
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
