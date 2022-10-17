import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';

class ProjetoModel {
  int? id;
  String? nome;
  String? dataInicial;
  String? observacao;
  String? dataFinal;
  String? cor;
  String? progresso = '0%';
  List<AtividadeModel?>? atividades;
  ResponseAPIModel? responseAPIModel;

  ProjetoModel(
      {this.id,
      this.nome,
      this.dataInicial,
      this.observacao,
      this.dataFinal,
      this.cor,
      this.atividades,
      this.progresso});

  ProjetoModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    dataInicial = json['dataInicial'];
    observacao = json['observacao'];
    dataFinal = json['dataFinal'];
    cor = json['cor'];
    progresso = json['progresso'];

    List<AtividadeModel> listaAtividades = [];
    json['atividade'].map((item) {
      listaAtividades.add(AtividadeModel(
        id: int.parse(item['id']),
        nome: item['nome'],
        dataInicial: item['dataInicial'],
        dataFinal: item['dataFinal'],
        observacao: item['observacao'],
        cor: item['cor'],
        prioridade: item['prioridade'],
        concluido: item['concluido'],
      ));
    }).toList();

    atividades = listaAtividades;
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
