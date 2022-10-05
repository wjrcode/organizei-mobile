import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Generica.dart';

class HabitoModel extends GenericaModel {
  int? id;
  String? nome;
  String? data;
  List<dynamic>? dias;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  HabitoModel({this.id, this.nome, this.data, this.dias, this.cor});

  HabitoModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    data = json['hora'];
    dias = json['dias'];
    cor = json['cor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['hora'] = this.data;
    data['dias'] = this.dias;
    data['cor'] = this.cor;

    return data;
  }
}
