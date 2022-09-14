import 'package:organizei/Model/API/ResponseAPIModel.dart';

class TarefaModel {
  int? id;
  String? nome;
  String? dataehora;
  String? observacao;
  String? prioridade;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  TarefaModel(
      {this.id,
      this.nome,
      this.dataehora,
      this.observacao,
      this.prioridade,
      this.cor});

  TarefaModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    dataehora = json['dataehora'];
    observacao = json['observacao'];
    prioridade = json['prioridade'];
    cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['dataehora'] = this.dataehora;
    data['observacao'] = this.observacao;
    data['prioridade'] = this.prioridade;
    data['cor'] = this.cor;

    return data;
  }
}
