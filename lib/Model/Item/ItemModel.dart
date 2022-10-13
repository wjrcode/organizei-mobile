import 'package:organizei/Model/API/ResponseAPIModel.dart';

class ItemModel {
  int? id;
  String? nome;
  bool? concluido;
  ResponseAPIModel? responseAPIModel;

  ItemModel({
    this.id,
    this.nome,
    this.concluido,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['concluido'] = concluido;

    return data;
  }
}
