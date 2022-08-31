import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:organizei/Model/Login/LoginModel.dart';

class LoginConfiguracoes {
  salvarArquivo(LoginModel login) async {
    var novoLogin = login;
    final arquivo = await _getFile();
    arquivo.exists().then((value) {
      arquivo.writeAsString(json.encode(novoLogin));
    });
  }

  Future<bool> existeLogin() async {
    var login = await getLogin();
    bool ret = false;

    if (login != null) {
      ret = true;
    }

    return ret;
  }

  deleteLogin(LoginModel login) async {
    var logins = await getLogin();
    //logins.removeWhere((e) => e.chaveCentralizador == login.chaveCentralizador);

    excluirArquivo();
    // salvarArquivo(logins);
  }

  Future<String> lerArquivo() async {
    try {
      if (await existeArquivo()) {
        final arquivo = await _getFile();
        final dados = arquivo.readAsString();
        return dados;
      }
      return "";
    } catch (ex) {
      print(ex);
      return "";
    }
  }

  Future<LoginModel?> getLogin() async {
    var archive = await lerArquivo();
    if (archive.isNotEmpty) {
      // final List<dynamic> decodedJson = jsonDecode(archive);

      //decodedJson.map((dynamic json) => LoginModel.fromJson(json)).toList();

      LoginModel login = LoginModel.fromJson(jsonDecode(archive));

      return login;
    }
    return null;
  }

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    var file = File("${dir.path}/login.json");

    return file;
  }

  excluirArquivo() async {
    final dir = await getApplicationDocumentsDirectory();
    final arq = Directory("${dir.path}/login.json");

    arq.deleteSync(recursive: true);
  }

  Future<bool> existeArquivo() async {
    var file = await _getFile();
    return await file.exists();
  }
}
