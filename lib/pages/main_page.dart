import 'package:flutter/material.dart';

import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/contatos.dart';
import 'package:trilhaapp/pages/list_view_h.dart';
import 'package:trilhaapp/pages/consulta_cep.dart';
import 'package:trilhaapp/widgets/custom_drawer.dart';

import 'Calculadora_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaopagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meu app"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaopagina = value;
                  });
                },
                //scrollDirection: Axis.vertical, (ativar aqui para ficar vertical)
                children: const [
                  CardPage(),
                  ContatosPage(),
                  CalculadoraPage(),
                  ListViewHPage(),
                  //ListViewCarrosel(),
                  ConsultaCEP(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.blue,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaopagina,
                unselectedItemColor: Colors.grey,
                items: const [
                  BottomNavigationBarItem(
                      label: "home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Contatos", icon: Icon(Icons.contacts)),
                  BottomNavigationBarItem(
                      label: "Calculadora", icon: Icon(Icons.calculate)),
                  BottomNavigationBarItem(
                      label: "Mensagens", icon: Icon(Icons.message)),
                  /*BottomNavigationBarItem(
                      label: "Paisagens", icon: Icon(Icons.landscape)),
                      */
                  BottomNavigationBarItem(
                      label: "BuscaCEP", icon: Icon(Icons.search_off)),
                ]),
          ],
        ),
      ),
    );
  }
}
