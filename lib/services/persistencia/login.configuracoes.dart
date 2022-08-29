import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:organizei/Model/Login/Login.dart';

class LoginConfiguracoes {
  salvarArquivo(List<Login?> login) async {
    var list = login;
    final arquivo = await _getFile();
    arquivo.exists().then((value) {
      if (value) {
        arquivo.readAsString().then((value) {
          final jsonLogins = ((json.decode(value) as List)
              .map((i) => Login.fromJson(i))
              .toList());
          jsonLogins.forEach((element) {
            list.add(element);
          });

          arquivo.writeAsString(json.encode(list));
        });
      } else {
        var dados = json.encode(login);
        arquivo.writeAsString(dados);
      }
    });
  }

  deleteLogin(Login login) async {
    var logins = await getListLogins();
    //logins.removeWhere((e) => e.chaveCentralizador == login.chaveCentralizador);

    excluirArquivo();
    salvarArquivo(logins);
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

  Future<List<Login>> getListLogins() async {
    List<Login> emptyList = [];
    var archive = await lerArquivo();
    if (archive.isNotEmpty) {
      List<Login> logins = ((json.decode(archive) as List)
          .map((i) => Login.fromJson(i))
          .toList());
      return logins;
    }
    return emptyList;
  }

  Future<int> getQuantidadeLogins() async {
    var logins = await getListLogins();
    return logins.length;
  }

  Future<bool> loginExists(Login login) async {
    var logins = await getListLogins();
    bool ret = true;

    logins.forEach((e) {
      if (e.usuario == login.usuario) {
        ret = true;
      }
    });

    return ret;
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
