class CepsBack4AppModel {
  List<CepBack4AppModel> cepsCadastrados = [];

  CepsBack4AppModel(this.cepsCadastrados);

  CepsBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      cepsCadastrados = <CepBack4AppModel>[];
      json['results'].forEach((v) {
        cepsCadastrados.add(CepBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = cepsCadastrados.map((v) => v.toJson()).toList();
      return data;
  }
}

class CepBack4AppModel {
  String? objectId;
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? createdAt;
  String? updatedAt;

  CepBack4AppModel(
      {this.objectId,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.createdAt,
      this.updatedAt});

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['bairro'] = this.bairro;
    data['localidade'] = this.localidade;
    data['uf'] = this.uf;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}