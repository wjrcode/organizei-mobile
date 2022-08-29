import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/Login/Login.dart';

class LoginRepository {
  Future<bool> autenticar(Login model) async {
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

    print(response.statusCode.toString());
    if (response.statusCode == 200) {
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
