import 'dart:convert';
import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Future<bool> autenticar(LoginModel model) async {
    var _url = Uri.parse(ApiModel().ApiUrl + '/signin');
    var json = {
      "email": model.usuario.toString().toLowerCase(),
      "senha": model.senha.toString().toLowerCase()
    };

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response =
        await http.post(_url, headers: headers, body: jsonEncode(json));

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final dadosLogin = jsonDecode(response.body);

      prefs.setString('UsuarioApelido', dadosLogin['apelido'].toString());
      prefs.setString('UsuarioToken', dadosLogin['token'].toString());
      return true;
    }

    return false;
  }

  Future<bool> redefinirSenha(LoginModel model) async {
    var _url = Uri.parse(ApiModel().ApiUrl + '/esquecisenha');
    var json = {
      "email": model.usuario.toString().toLowerCase(),
    };

    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response =
        await http.post(_url, headers: headers, body: jsonEncode(json));

    if (response.statusCode == 201) {
      return true;
    }

    return false;
  }

  Future<UsuarioModel> getUsuarioLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('UsuarioToken');
    print(token);

    var _url = Uri.parse(ApiModel().ApiUrl + '/usuario/' + token!);

    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    UsuarioModel usuario = UsuarioModel.fromJson(jsonDecode(response.body));

    return usuario;
  }
}
