import 'package:organizei/Model/API/ResponseAPIModel.dart';

class UsuarioModel {
  int? id;
  String? nome;
  String? apelido;
  String? email;
  String? senha;
  String? novaSenha;
  ResponseAPIModel? responseAPIModel;

  UsuarioModel({
    this.id,
    this.nome,
    this.apelido,
    this.email,
    this.senha,
    this.novaSenha,
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
    data['id'] = id;
    data['nome'] = nome;
    data['apelido'] = apelido;
    data['email'] = email;
    data['senha'] = senha;
    data['novaSenha'] = novaSenha;

    return data;
  }
}
