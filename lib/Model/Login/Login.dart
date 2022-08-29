import 'package:organizei/Model/API/ResponseAPIModel.dart';

class Login {
  String? usuario;
  String? senha;
  ResponseAPIModel? responseAPIModel;

  Login({
    this.usuario,
    this.senha,
  });

  Login.fromJson(Map<String, dynamic> json) {
    usuario = json['usuario'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuario'] = this.usuario;
    data['senha'] = this.senha;

    return data;
  }
}
