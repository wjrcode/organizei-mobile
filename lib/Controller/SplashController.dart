import 'package:flutter/cupertino.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:organizei/home_page.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';
import 'package:organizei/start_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends Base {
  var _configuracoes = LoginConfiguracoes();

  Future<Widget?> telaInicial() async {
    LoginModel? login = await _configuracoes.getLogin();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? apelido = prefs.getString('UsuarioLogado');

    if (login != null) {
      return HomePage(apelido: apelido);
    } else
      return StartPage();
  }
}
