import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado = 0;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALEATORIO);
    });

    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Numeros Aleatorios")),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              numeroGerado == null ? "" : numeroGerado.toString(),
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final storage = await SharedPreferences.getInstance();
          var random = Random();

          setState(() {
            numeroGerado = random.nextInt(1000);
          });
          storage.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
        },
      ),
    ));
  }
}
