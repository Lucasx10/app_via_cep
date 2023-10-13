import 'package:app_via_cep/model/cep_back4app_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CepBack4AppRepository {
  final _dio = Dio();

  Future<CepsBack4AppModel> consultaCeps() async {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get("BACK4APPAPPLICATIONID");
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get("BACK4APPRESTAPIKEY");
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APPBASEURL");

    var url = "/Cep";

    var result = await _dio.get(url);
    return CepsBack4AppModel.fromJson(result.data);
  }

  Future<void> salvar(CepBack4AppModel cepBack4AppModel) async {
    try {
      _dio.options.headers["X-Parse-Application-Id"] =
          dotenv.get("BACK4APPAPPLICATIONID");
      _dio.options.headers["X-Parse-REST-API-Key"] =
          dotenv.get("BACK4APPRESTAPIKEY");
      _dio.options.headers["Content-Type"] = "application/json";
      var url = dotenv.get("BACK4APPBASEURL");

      await _dio.post("$url/Cep", data: cepBack4AppModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(CepBack4AppModel cepBack4AppModel) async {
    try {
      _dio.options.headers["X-Parse-Application-Id"] =
          dotenv.get("BACK4APPAPPLICATIONID");
      _dio.options.headers["X-Parse-REST-API-Key"] =
          dotenv.get("BACK4APPRESTAPIKEY");
      _dio.options.headers["Content-Type"] = "application/json";
      var url = dotenv.get("BACK4APPBASEURL");

      await _dio.put("$url/Cep/${cepBack4AppModel.objectId}",
          data: cepBack4AppModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      _dio.options.headers["X-Parse-Application-Id"] =
          dotenv.get("BACK4APPAPPLICATIONID");
      _dio.options.headers["X-Parse-REST-API-Key"] =
          dotenv.get("BACK4APPRESTAPIKEY");
      _dio.options.headers["Content-Type"] = "application/json";
      var url = dotenv.get("BACK4APPBASEURL");

      await _dio.delete("$url/Cep/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
