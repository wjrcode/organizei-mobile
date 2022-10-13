import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Item/ItemModel.dart';

class ListaModel {
  int? id;
  String? nome;
  String? cor;
  List<ItemModel?>? itens;
  ResponseAPIModel? responseAPIModel;

  ListaModel({
    this.id,
    this.nome,
    this.cor,
    this.itens,
  });

  ListaModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    cor = json['cor'];
    itens = json['itens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['cor'] = cor;
    data['itens'] = itens;

    return data;
  }
}
