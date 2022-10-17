import 'package:flutter/material.dart';
import 'package:organizei/Controller/LoginController.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/login/usuarioCadastroDialog.dart';
import 'package:organizei/components/dialogs/tarefas/tarefaCadastroDialog.dart';
import 'package:organizei/start_page.dart';
import '../../../Controller/TarefaController.dart';

Future<dynamic> sair(BuildContext context, {Function? fecharDialog}) {
  UsuarioModel? usuario;

  late LoginController loginController;

  loginController = LoginController(LoginRepository(), context);
  return showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Material(
                type: MaterialType.transparency,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: DialogPersonalizado(
                      nome: '',
                      cor: '',
                      child: <Widget>[
                        Botao(
                          texto: 'Editar perfil',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            cadastrarUsuario(context,
                                usuario: usuario, fecharDialog: fecharDialog);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 16),
                          child: Botao(
                            texto: 'Sair',
                            cor: const Color(0xFFEF7E69),
                            clicar: () async {
                              await loginController.limpaPreferencesLogin();

                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const StartPage()),
                                  (route) => false);

                              // if (succes == true) {
                              //   Navigator.pop(context);
                              //   fecharDialog!();
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      });
}
