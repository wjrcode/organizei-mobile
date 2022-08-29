import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  Future<ResponseAPIModel> addUsuario(UsuarioModel model) async {
    print(model.apelido);
    var json = {
      "nome": model.nome,
      "apelido": model.apelido,
      "email": model.email,
      "senha": model.senha,
    };

    print(ApiModel.ApiUrl + '/usuarios');

    final response = await http.post(Uri.parse(ApiModel.ApiUrl + '/usuarios'),
        headers: ApiModel.headers, body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }
}
