import 'package:flutter/material.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioController extends Base {
  UsuarioController(this.repository, this.context);

  final BuildContext context;
  final UsuarioRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = UsuarioModel();
  var loginConfiguracoes = LoginConfiguracoes();

  usuarioId(int? value) => model.id = value;
  usuarioNome(String? value) => model.nome = value.toString();
  usuarioApelido(String? value) => model.apelido = value.toString();
  usuarioEmail(String? value) => model.email = value.toString();
  usuarioSenha(String? value) => model.senha = value.toString();
  usuarioNovaSenha(String? value) => model.novaSenha = value.toString();

  var controllerNome = TextEditingController();
  var controllerApelido = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerSenha = TextEditingController();
  var controllerNovaSenha = TextEditingController();

  Future<bool> saveUsuario() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addUsuario(model).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(value.msg!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            backgroundColor: value.valido!
                ? const Color(0xFF74C198)
                : const Color(0xFFEF7E69),
          ));

          if (value.valido!) {
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        return await repository.updateUsuario(model).then((value) async {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(value.msg!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            backgroundColor: value.valido!
                ? const Color(0xFF74C198)
                : const Color(0xFFEF7E69),
          ));

          if (value.valido! == true) {
            prefs.setString('UsuarioApelido', model.apelido ?? '');
            return value.valido!;
          } else {
            return false;
          }
        });
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
