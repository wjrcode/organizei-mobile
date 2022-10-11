import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Generica.dart';

class HabitoModel extends GenericaModel {
  int? id;
  int? idRotina;
  String? nome;
  String? data;
  String? dataFinal;
  List<dynamic>? dias;
  String? cor;
  ResponseAPIModel? responseAPIModel;

  HabitoModel(
      {this.id,
      this.nome,
      this.data,
      this.dias,
      this.cor,
      this.idRotina,
      this.dataFinal});

  HabitoModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    idRotina = int.parse(json['idRotina']);
    nome = json['nome'];
    data = json['hora'];
    dias = json['dias'];
    cor = json['cor'];
    dataFinal = json['dataFinal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idRotina'] = idRotina;
    data['id'] = id;
    data['nome'] = nome;
    data['hora'] = data;
    data['dias'] = dias;
    data['cor'] = cor;
    data['dataFinal'] = dataFinal;

    return data;
  }
}
