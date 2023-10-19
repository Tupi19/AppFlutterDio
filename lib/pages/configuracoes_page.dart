import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text("Configurações")),
          body: Container(
            child: ListView(
              children: [
                SwitchListTile(
                  title: const Text("Receber notificações"),
                  onChanged: (bool value) {
                    setState(() {
                      receberNotificacoes = !receberNotificacoes;
                    });
                  },
                  value: receberNotificacoes,
                ),
                SwitchListTile(
                  title: const Text("Tema Escuro"),
                  onChanged: (bool value) {
                    setState(() {
                      temaEscuro = !temaEscuro;
                    });
                  },
                  value: temaEscuro,
                )
              ],
            ),
          )),
    );
  }
}
