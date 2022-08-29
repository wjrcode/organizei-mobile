import 'package:organizei/Model/API/ResponseAPIModel.dart';

class UsuarioModel {
  int? id;
  String? nome;
  String? apelido;
  String? email;
  String? senha;
  ResponseAPIModel? responseAPIModel;

  UsuarioModel({
    this.id,
    this.nome,
    this.apelido,
    this.email,
    this.senha,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nome = json['nome'];
    apelido = json['apelido'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['apelido'] = this.apelido;
    data['email'] = this.email;
    data['senha'] = this.senha;

    return data;
  }
}
