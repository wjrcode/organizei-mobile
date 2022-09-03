import 'dart:convert';
import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Future<bool> autenticar(LoginModel model) async {
    var _url = Uri.parse(ApiModel.ApiUrl + '/signin');
    var json = {
      "email": model.usuario.toString().toLowerCase(),
      "senha": model.senha.toString().toLowerCase()
      /*md5
          .convert(utf8.encode(model.senha.toString().toLowerCase()))
          .toString(),*/
    };

    final response = await http.post(_url,
        headers: ApiModel.headers, body: jsonEncode(json));

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final dadosLogin = ResponseAPIModel.fromJson(jsonDecode(response.body));

      prefs.setString('UsuarioApelido', dadosLogin.msg.toString());
      print(dadosLogin.msg.toString());
      return true;
    }

    return false;
  }

  Future<bool> validarDispositivo(String id) async {
    var _url = Uri.parse(ApiModel.ApiUrl + '/dispositivos/' + id + '/validar');

    final response = await http.post(_url, headers: ApiModel.headers);

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}
