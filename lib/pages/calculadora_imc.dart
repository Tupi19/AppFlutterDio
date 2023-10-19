// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/text_label.dart';

class CalculadoraImc extends StatefulWidget {
  const CalculadoraImc({super.key});

  @override
  State<CalculadoraImc> createState() => _CalculadoraImcState();
}

class _CalculadoraImcState extends State<CalculadoraImc> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");

  final CHAVE_ALTURA = "altura escolhida";
  final CHAVE_NOME = "Nome escolhido";

  double alturaEscolhida = 0;

  bool salvando = false;
  double peso = 0;

  calculaIMC() {
    double? peso = double.tryParse(pesoController.text.trim());
    double altura = alturaEscolhida / 100;

    //Peso dividido pelo quadrado da altura: 70 / 2,89 = 24,22
    double imc = peso! / (altura * altura);
    return imc;
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    carregarDados();
  }

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      nomeController.text = storage.getString(CHAVE_NOME) ?? "";
      alturaEscolhida = storage.getDouble(CHAVE_ALTURA) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora IMC")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(
                    texto: "Nome",
                  ),
                  TextField(
                    controller: nomeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextLabel(texto: "Peso"),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: pesoController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextLabel(texto: "Altura:  ${alturaEscolhida.round()} cm"),
                  Slider(
                      min: 0,
                      max: 220,
                      value: alturaEscolhida,
                      onChanged: (double value) {
                        setState(() {
                          alturaEscolhida = value;
                        });
                      }),
                  TextButton(
                    onPressed: () async {
                      double imc = calculaIMC();

                      interpretaIMC() {
                        var info = "";
                        if (imc < 18.5) {
                          info = "abaixo do Peso";
                        } else if (imc < 24.9) {
                          info = "no Peso ideial";
                        } else if (imc < 29.9) {
                          info = "levemente acima do peso";
                        } else if (imc < 34.9) {
                          info = "com obesidade Grau I ";
                        } else if (imc < 39.9) {
                          info = "com obesidade Grau II";
                        } else {
                          info = "com obesidade Grau III ";
                        }

                        return info;
                      }

                      String info = interpretaIMC();

                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O nome deve ser preenchido!")));
                        return;
                      }

                      if (pesoController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O peso deve ser preenchido!")));
                        return;
                      }

                      if (alturaEscolhida == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Escolher a altura!")));
                        return;
                      }

                      final storage = await SharedPreferences.getInstance();

                      storage.setDouble(CHAVE_ALTURA, alturaEscolhida);
                      storage.setString(CHAVE_NOME, nomeController.text);

                      // ignore: use_build_context_synchronously
                      showDialog(
                          context: context,
                          builder: (BuildContext bc) => AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 248),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Column(
                                  children: [
                                    Text(
                                        "Seu IMC é de ${imc.toStringAsPrecision(3)} "),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Você está $info",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ));
                    },
                    child: const Text("calcular"),
                  ),
                ],
              ),
      ),
    );
  }
}
