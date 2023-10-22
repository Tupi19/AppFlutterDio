import 'package:dio/dio.dart';
import 'package:trilhaapp/model/contatos_model.dart';

class ContatosRepository {
  Future<ContatosModel> obterContatos() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "gR6yQMR3evftzhCz1YnoOWtbyJhaaCMogykTEaPW";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "ErTKKJwXweXUrs9sHD98FuwWoHB1L1ZM0iHINbZk";
    dio.options.headers["Content-Type"] = "application/json";

    var result =
        await dio.get("https://parseapi.back4app.com/classes/Contatos");
    return ContatosModel.fromJson(result.data);
  }
}
