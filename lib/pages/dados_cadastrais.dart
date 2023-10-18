import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNascimentoController =
      TextEditingController(text: "");
  DateTime? dataNascimento;

  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i < quantidadeMaxima; i++) {
      itens.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }

    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Dados")),
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
                  const TextLabel(texto: "Data de nascimento"),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 12, 30));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextLabel(texto: "Nível de experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            title: Text(nivel),
                            selected: nivelSelecionado == nivel,
                            value: nivel,
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              setState(() {
                                nivelSelecionado = value;
                              });
                            }))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextLabel(texto: "Domínio de Linguagens"),
                  Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                              }))
                          .toList()),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextLabel(texto: "Tempo de experiência"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(50),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  TextLabel(
                      texto:
                          "Pretensão salarial: R\$ ${salarioEscolhido.round()}"),
                  Slider(
                      min: 0,
                      max: 20000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          salvando = false;
                        });
                        if (nomeController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("O nome deve ser preenchido!")));
                          return;
                        }

                        if (dataNascimento == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A data de nascimento deve ser preenchida!")));
                          return;
                        }

                        if (nivelSelecionado == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecionar nivel de experiencia!")));
                          return;
                        }

                        if (linguagensSelecionadas.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecionar domínio de linguagens!")));
                          return;
                        }

                        if (tempoExperiencia == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecionar tempo de experiência!")));
                          return;
                        }

                        if (salarioEscolhido == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Escolher o salário pretendido!")));
                          return;
                        }

                        setState(() {
                          salvando = true;
                        });

                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            salvando = false;
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Dados salvos com sucesso!")));
                          });
                        });
                      },
                      child: const Text("Salvar")),
                ],
              ),
      ),
    );
  }
}
