import 'package:organizei/Model/API/ResponseAPIModel.dart';

class GenericaModel {
  String? tipo;

  ResponseAPIModel? responseAPIModel;

  GenericaModel({this.tipo});

  GenericaModel.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    return data;
  }
}
