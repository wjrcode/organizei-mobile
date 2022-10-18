import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  Future<ResponseAPIModel> addUsuario(UsuarioModel model) async {
    var json = {
      "nome": model.nome,
      "apelido": model.apelido,
      "email": model.email,
      "senha": model.senha,
    };

    final response = await http.post(Uri.parse(ApiModel().ApiUrl + '/usuarios'),
        headers: await ApiModel().getHeaders(), body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateUsuario(UsuarioModel model) async {
    var json = {
      "nome": model.nome,
      "apelido": model.apelido,
      "email": model.email,
      "senha": model.senha,
      "novaSenha": model.novaSenha
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl + '/usuarios/' + model.id.toString()),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }
}
