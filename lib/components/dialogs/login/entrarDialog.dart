import 'package:flutter/material.dart';
import 'package:organizei/Controller/LoginController.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> entrar(BuildContext context) {
  late LoginController loginController;

  loginController = LoginController(LoginRepository(), context);

  print('chmei');

  return showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (context) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Material(
                type: MaterialType.transparency,
                child: Material(
                  type: MaterialType.transparency,
                  child: Form(
                    key: loginController.formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: DialogPersonalizado(
                          nome: 'Login',
                          //minHeight: MediaQuery.of(context).size.height * 0.8,
                          child: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: input(
                                key: Key("keyTextEmail"),
                                onSaved: loginController.loginUsuario,
                                textController:
                                    loginController.controllerUsuario,
                                label: 'e-mail',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: input(
                                  key: Key("keyTextSenha"),
                                  onSaved: loginController.loginSenha,
                                  textController:
                                      loginController.controllerSenha,
                                  label: 'senha',
                                  senha: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                              child: Botao(
                                key: Key("keyEntrarButton"),
                                texto: 'Entrar',
                                cor: const Color(0xFF6BC8E4),
                                clicar: () async {
                                  print('over');
                                  bool succes =
                                      await loginController.autentica();

                                  if (succes) {
                                    Navigator.of(context).push<void>(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const HomePage(),
                                      ),
                                    );
                                  }
                                  ;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
      });
}
