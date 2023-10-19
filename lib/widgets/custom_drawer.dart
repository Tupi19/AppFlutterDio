import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (BuildContext bc) {
                      return const Wrap(children: [
                        ListTile(
                          title: Text("Camera"),
                          leading: Icon(Icons.camera_alt),
                        ),
                        ListTile(
                          title: Text("Galeria"),
                          leading: Icon(Icons.photo_album),
                        )
                      ]);
                    });
              },
              child: UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.lightGreen),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                  ),
                  accountName: const Text("Guilherme tupinambá"),
                  accountEmail: const Text("email@email.com")),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Dados Cadastrais"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DadosCadastraisPage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Termos de uso e Privacidade"),
                    ],
                  )),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(children: [
                        ListTile(
                            title: const Text("Termos de Uso"),
                            leading: const Icon(Icons.info),
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  context: context,
                                  builder: (BuildContext bc) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: const Column(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Termos de Uso",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                              "O usuário deve usar o aplicativo de forma adequada e legal, sem violar as leis aplicáveis e os direitos de terceiros.",
                                              style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    );
                                  });
                            }),
                        const ListTile(
                          title: Text("About"),
                          leading: Icon(Icons.computer),
                        )
                      ]);
                    });
              },
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Configurações"),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext bc) =>
                            const ConfiguracoesPage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.numbers_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Números Aleatórios"),
                    ],
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext bc) =>
                            const NumerosAleatoriosPage()));
              },
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.door_back_door),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Logout"),
                    ],
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: const Text(
                          "ATENÇÃO",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content:
                            const Text("Deseja realmente efetuar o logout?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Não")),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text("Sim"))
                        ],
                      );
                    });
                //Navigator.push(context,
                //  MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
