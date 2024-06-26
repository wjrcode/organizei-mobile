import 'package:organizei/Model/API/ResponseAPIModel.dart';

class TarefaModel {
  int? id;
  String? nome;
  String? data;
  String? observacao;
  String? prioridade;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  TarefaModel(
      {this.id,
      this.nome,
      this.data,
      this.observacao,
      this.prioridade,
      this.cor});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    data = json['data'];
    observacao = json['observacao'];
    prioridade = json['prioridade'];
    cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['data'] = data;
    data['observacao'] = observacao;
    data['prioridade'] = prioridade;
    data['cor'] = cor;

    return data;
  }
}
