import 'package:app_via_cep/model/cep_back4app_model.dart';
import 'package:dio/dio.dart';

class ViaCepRepository {
  var _dio = Dio();

  Future<CepBack4AppModel> obterCep(String cep) async {
    try {
      var url = "https://viacep.com.br/ws/$cep/json/";
      var results = await _dio.get(url);
      if (results.statusCode == 200) {
        return CepBack4AppModel.fromJson(results.data);
      }
    } catch (e) {
      rethrow;
    }
    return CepBack4AppModel();
  }
}