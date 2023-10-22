import 'package:flutter/material.dart';
import 'package:trilhaapp/model/contatos_model.dart';
import 'package:trilhaapp/repositories/contatosrepository/contatosrepository.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({super.key});

  @override
  State<ContatosPage> createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  ContatosRepository contatorepository = ContatosRepository();
  var _contatosback4app = ContatosModel([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterContato();
  }

  void obterContato() async {
    _contatosback4app = await contatorepository.obterContatos();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(children: [
        const Expanded(
          flex: 1,
          child: Text(
            "LISTA DE CONTATOS BACK4APP",
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView.builder(
              itemCount: _contatosback4app.contatos.length,
              itemBuilder: (BuildContext bc, int index) {
                var contato = _contatosback4app.contatos[index];
                return Dismissible(
                  onDismissed: (DismissDirection dismissdirection) async {
                    obterContato();
                  },
                  key: Key(contato.nome),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      shape: const Border.symmetric(
                        vertical: BorderSide.none,
                        horizontal: BorderSide(color: Colors.black, width: 0.2),
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.blue,
                      ),
                      title: Text(contato.nome),
                      subtitle: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Telefone:"),
                              Text(
                                contato.telefone.toStringAsFixed(0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: PopupMenuButton<String>(
                        onSelected: (menu) {},
                        itemBuilder: (BuildContext bc) {
                          return <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                                value: "Mensagem",
                                child: Text("Enviar Mensagem"))
                          ];
                        },
                      ),
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
