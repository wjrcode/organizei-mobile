import 'package:organizei/Model/API/ResponseAPIModel.dart';

class AtividadeModel {
  int? id;
  int? idProjeto;
  String? nome;
  String? dataInicial;
  String? observacao;
  String? dataFinal;
  String? cor;
  String? prioridade;
  bool? concluido;
  ResponseAPIModel? responseAPIModel;

  AtividadeModel({
    this.id,
    this.nome,
    this.dataInicial,
    this.observacao,
    this.dataFinal,
    this.cor,
    this.prioridade,
    this.concluido,
  });

  AtividadeModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    dataInicial = json['dataInicial'];
    observacao = json['observacao'];
    dataFinal = json['dataFinal'];
    cor = json['cor'];
    prioridade = json['prioridade'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['dataInicial'] = dataInicial;
    data['observacao'] = observacao;
    data['dataFinal'] = dataFinal;
    data['cor'] = cor;
    data['prioridade'] = prioridade;
    data['concluido'] = concluido;

    return data;
  }
}
