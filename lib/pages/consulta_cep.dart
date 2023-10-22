import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

import '../model/viacep_model.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  var cepController = TextEditingController(text: "");

  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCEPrepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: cepController,
                keyboardType: TextInputType.number,
                //maxLength: 8,
                onChanged: (value) async {
                  var cep = value;
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                  }

                  viacepModel = await viaCEPRepository.consultarCEP(cep);

                  setState(() {
                    loading = false;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                viacepModel.logradouro ?? "",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
