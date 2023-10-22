import 'package:dio/dio.dart';
import 'package:trilhaapp/model/tarefas_model.dart';

class TarefasBack4AppRepository {
  Future<TarefasBack4AppModel> obterTarefas() async {
    var dio = Dio();
    var result = await dio.get("https://parseapi.back4app.com/classes/TAREFAS");
    return TarefasBack4AppModel.fromJson(result.data);
  }
}
