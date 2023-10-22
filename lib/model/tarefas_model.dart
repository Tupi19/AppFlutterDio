class TarefasBack4AppModel {
  List<Tarefa> tarefas = [];

  TarefasBack4AppModel(this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <Tarefa>[];
      json['results'].forEach((v) {
        tarefas.add(new Tarefa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class Tarefa {
  String objectId = "";
  String dESCRICAO = "";
  bool concluido = false;
  String createdAt = "";
  String updatedAt = "";

  Tarefa(this.objectId, this.dESCRICAO, this.concluido, this.createdAt,
      this.updatedAt);

  Tarefa.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    dESCRICAO = json['DESCRICAO'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = objectId;
    data['DESCRICAO'] = dESCRICAO;
    data['concluido'] = concluido;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
