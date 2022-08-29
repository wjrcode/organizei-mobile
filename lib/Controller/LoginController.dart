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

  loginUsuario(String? value) => model.usuario = value.toString().toUpperCase();
  loginSenha(String? value) => model.senha = value.toString().toLowerCase();

  var controllerUsuario = TextEditingController();
  var controllerSenha = TextEditingController();

  Future<bool> autentica() async {
    /*if (!formKey.currentState!.validate()) {
      return false;
    }*/

    formKey.currentState!.save();

    //SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      //showReloadDialog(context, 'Realizando login, aguarde...');
      //model.cpfcnpj = prefs.getString('EmpresaCpfcnpj');

      //model.chaveCentralizador = prefs.getString('EmpresaChaveCentralizador');
      bool ret = await repository.autenticar(model);
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

  Future<bool> validaDispositivo() async {
    var deviceDetailsController = DeviceDetailsController();
    var deviceDetails = await deviceDetailsController.getDeviceDetails();

    String _id = deviceDetails.identifier.toString();

    try {
      showReloadDialog(context, 'Validando dispositivo, aguarde...');

      bool ret = await repository.validarDispositivo(_id);

      return ret;
    } catch (e) {
      return false;
    } finally {
      closeAlertDialog(context);
    }
  }

  Future<String> getBottomText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nome = prefs.getString('EmpresaNome');
    var cpfcnpj = prefs.getString('EmpresaCpfcnpj');

    return '$nome - $cpfcnpj';
  }

  Future<String> getVersao() async {
    var deviceDetailsController = DeviceDetailsController();
    var deviceDetails = await deviceDetailsController.getDeviceDetails();

    String _versaoApp = deviceDetails.appVersion.toString();
    String _buildApp = deviceDetails.appBuildNumber.toString();

    return '$_versaoApp.$_buildApp';
  }

  salvarLogin(LoginModel login) async {
    List<LoginModel?> listaLogins = await loginConfiguracoes.getListLogins();

    listaLogins.add(login);
    await loginConfiguracoes.salvarArquivo(listaLogins);
  }

  bool existeLogin() {
    loginConfiguracoes.existeArquivo().then((value) {
      return value;
    });

    return false;
  }

  Future<List<LoginModel>?> getLogins() {
    return loginConfiguracoes.getListLogins();
  }

  deleteLogin(LoginModel login) async {
    showReloadDialog(context, 'Excluindo, aguarde...');
    bool exists = await loginConfiguracoes.loginExists(login);

    if (exists) {
      await loginConfiguracoes.deleteLogin(login);
      await _limpaPreferencesLogin(login);
    }

    closeAlertDialog(context);
  }

  _limpaPreferencesLogin(LoginModel login) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString('usuario', '');
    prefs.setString('senha', '');
  }
}
