import 'package:flutter/material.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class UsuarioController extends Base {
  UsuarioController(this.repository, this.context);

  final BuildContext context;
  final UsuarioRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = UsuarioModel();
  var loginConfiguracoes = LoginConfiguracoes();

  usuarioNome(String? value) => model.nome = value.toString();
  usuarioApelido(String? value) => model.apelido = value.toString();
  usuarioEmail(String? value) => model.email = value.toString();
  usuarioSenha(String? value) => model.senha = value.toString();

  var controllerNome = TextEditingController();
  var controllerApelido = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerSenha = TextEditingController();

  Future<bool> saveProduto() async {
    print('entreo');
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      print(model.nome);
      if (model.id == '' || model.id == null) {
        print('coração vou cadastrar');
        return await repository.addUsuario(model).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.msg!),
            backgroundColor: value.valido! ? Colors.green : Colors.red,
          ));
          if (value.valido!) {
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        /*return await repository.updateProduto(model).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.msg),
            backgroundColor: value.valido ? Colors.green : Colors.red,
          ));
          return value.valido;
        });*/
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
