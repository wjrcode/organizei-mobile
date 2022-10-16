import 'package:organizei/Model/API/ResponseAPIModel.dart';

class ProjetoModel {
  int? id;
  String? nome;
  String? dataInicial;
  String? observacao;
  String? dataFinal;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  ProjetoModel(
      {this.id,
      this.nome,
      this.dataInicial,
      this.observacao,
      this.dataFinal,
      this.cor});

  ProjetoModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    dataInicial = json['dataInicial'];
    observacao = json['observacao'];
    dataFinal = json['dataFinal'];
    cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['dataInicial'] = dataInicial;
    data['observacao'] = observacao;
    data['dataFinal'] = dataFinal;
    data['cor'] = cor;

    return data;
  }
}
