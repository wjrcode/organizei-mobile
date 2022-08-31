import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Controller/DeviceDetailsController.dart';
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Login/LoginModel.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class LoginController extends Base {
  LoginController(this.repository, this.context);

  final BuildContext context;
  final LoginRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = LoginModel();
  var loginConfiguracoes = LoginConfiguracoes();

  loginUsuario(String? value) => model.usuario = value.toString().toLowerCase();
  loginSenha(String? value) => model.senha = value.toString().toLowerCase();

  var controllerUsuario = TextEditingController();
  var controllerSenha = TextEditingController();

  Future<bool> autentica() async {
    /* if (!formKey.currentState!.validate()) {
      return false;
    }*/

    formKey.currentState!.save();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      //showReloadDialog(context, 'Realizando login, aguarde...');
      //model.cpfcnpj = prefs.getString('EmpresaCpfcnpj');

      //model.chaveCentralizador = prefs.getString('EmpresaChaveCentralizador');
      bool ret = await repository.autenticar(model);

      if (!ret) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(16),
          ),
          content: const Text(
            'E-mail/Senha inválidos!',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor: const Color(0xFFEF7E69),
        ));
      }
      prefs.setString('UsuarioLogado', model.usuario.toString());
      salvarLogin(model);

      /*if (ret) {
        prefs.setString('UsuarioLogado', model.usuario.toString());
        salvarLogin(model);
      }*/

      return ret;
    } catch (e) {
      return false;
    } finally {
      //closeAlertDialog(context);
    }
  }

  salvarLogin(LoginModel login) async {
    //LoginModel? login = await loginConfiguracoes.getLogin();

    await loginConfiguracoes.salvarArquivo(login);
  }

  bool existeLogin() {
    loginConfiguracoes.existeArquivo().then((value) {
      return value;
    });

    return false;
  }

  Future<LoginModel?> getLogin() {
    return loginConfiguracoes.getLogin();
  }

  _limpaPreferencesLogin(LoginModel login) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString('usuario', '');
    prefs.setString('senha', '');
  }

  Future<String> getUsuarioLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    LoginModel? login = await getLogin();

    String usuario = login!.usuario.toString();

    return '$usuario';
  }

  Future<String> getSenhaUsuarioLogado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? chaveCentralizador = prefs.getString('EmpresaChaveCentralizador');

    LoginModel? login = await getLogin();

    String senha = login!.senha.toString();

    return '$senha';
  }
}
