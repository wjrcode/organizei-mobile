import 'package:organizei/Model/API/ResponseAPIModel.dart';

class LembreteModel {
  int? id;
  String? nome;
  String? data;
  bool? eAniversario;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  LembreteModel({this.id, this.nome, this.data, this.eAniversario, this.cor});

  LembreteModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    data = json['data'];
    eAniversario = json['eAniversario'];
    cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['data'] = data;
    data['eAniversario'] = eAniversario;
    data['cor'] = cor;

    return data;
  }
}
