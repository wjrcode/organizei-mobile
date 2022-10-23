import 'package:flutter/material.dart';
import 'package:organizei/Controller/UsuarioController.dart';
import 'package:organizei/Model/Usuario/UsuarioModel.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/home_page.dart';

Future<dynamic> cadastrarUsuario(BuildContext context,
    {UsuarioModel? usuario, Function? fecharDialog}) {
  late UsuarioController usuarioController;
  usuarioController = UsuarioController(UsuarioRepository(), context);

  if (usuario != null) {
    usuarioController.controllerNome.text = usuario.nome ?? '';
    usuarioController.controllerApelido.text = usuario.apelido ?? '';
    usuarioController.controllerEmail.text = usuario.email ?? '';
    usuarioController.usuarioId(usuario.id);
  }

  Widget _buildNovaSenha() {
    return usuario != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: input(
                onSaved: usuarioController.usuarioNovaSenha,
                textController: usuarioController.controllerNovaSenha,
                label: 'nova senha',
                senha: true),
            //child: Input(label: 'senha'),
          )
        : Container();
  }

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
              child: Form(
                key: usuarioController.formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: DialogPersonalizado(
                      nome: 'Cadastro',
                      //minHeight: MediaQuery.of(context).size.height * 0.8,
                      child: <Widget>[
                        const Text('*Todos os campos são obrigatórios'),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: usuarioController.usuarioNome,
                            textController: usuarioController.controllerNome,
                            label: 'nome',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: usuarioController.usuarioApelido,
                            textController: usuarioController.controllerApelido,
                            label: 'apelido',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: usuarioController.usuarioEmail,
                            textController: usuarioController.controllerEmail,
                            label: 'e-mail',
                          ),
                          //child: Input(label: 'e-mail'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                              onSaved: usuarioController.usuarioSenha,
                              textController: usuarioController.controllerSenha,
                              label: (usuario != null && usuario.id != null)
                                  ? 'senha atual'
                                  : 'senha',
                              senha: true),
                          //child: Input(label: 'senha'),
                        ),
                        _buildNovaSenha(),
                        Botao(
                          key: Key("keySalvarButton"),
                          texto: 'salvar',
                          cor: const Color(0xFF6BC8E4),
                          clicar: () async {
                            bool succes = await usuarioController.saveUsuario();

                            if (succes == true) {
                              if (usuario == null) {
                                Navigator.pop(context);
                                entrar(context);
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()),
                                    (route) => false);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
