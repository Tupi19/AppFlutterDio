class ContatosModel {
  List<Contato> contatos = [];

  ContatosModel(this.contatos);

  ContatosModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contatos = <Contato>[];
      json['results'].forEach((v) {
        contatos.add(Contato.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = contatos.map((v) => v.toJson()).toList();
    return data;
  }
}

class Contato {
  String objectId = "";
  String nome = "";
  int telefone = 0;
  String createdAt = "";
  String updatedAt = "";

  Contato(
      {required this.objectId,
      required this.nome,
      required this.telefone,
      required this.createdAt,
      required this.updatedAt});

  Contato.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['Nome'];
    telefone = json['Telefone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['Nome'] = nome;
    data['Telefone'] = telefone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
