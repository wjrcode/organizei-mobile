import 'package:flutter/material.dart';
import 'package:organizei/Controller/LoginController.dart';
import 'package:organizei/Controller/UsuarioController.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/components/TextField.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late LoginController controller;
  late UsuarioController usuarioController;

  @override
  initState() {
    controller = LoginController(LoginRepository(), context);
    usuarioController = UsuarioController(UsuarioRepository(), context);

    //controller.controllerSenha.text = 'fafadfadf';
    debugPrint('iniciou');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 239, 125, 105),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 16.0),
                child: Botao(
                    texto: 'Entrar',
                    cor: const Color(0xFF74C198),
                    clicar: () {
                      entrar(context);
                    }),
              ),
              Botao(
                texto: 'Cadastre-se',
                cor: const Color(0xFF6385C3),
                clicar: () {
                  cadastrar(context);
                },
              ),
            ]),
      )),
    );
  }

  Future<dynamic> entrar(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Form(
              key: controller.formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: DialogPersonalizado(
                  nome: 'Login',
                  //minHeight: MediaQuery.of(context).size.height * 0.8,
                  child: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        controller.loginUsuario,
                        controller.controllerUsuario,
                        'e-mail',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        controller.loginSenha,
                        controller.controllerSenha,
                        'senha',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      child: Botao(
                        texto: 'Entrar',
                        cor: const Color(0xFF6BC8E4),
                        clicar: () async {
                          bool succes = await controller.autentica();

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
          );
        });
  }

  Future<dynamic> cadastrar(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Form(
              key: usuarioController.formKey,
              child: Container(
                margin: const EdgeInsets.only(top: 24),
                child: DialogPersonalizado(
                  nome: 'Cadastro',
                  //minHeight: MediaQuery.of(context).size.height * 0.8,
                  child: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        usuarioController.usuarioNome,
                        usuarioController.controllerNome,
                        'nome',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        usuarioController.usuarioApelido,
                        usuarioController.controllerApelido,
                        'apelido',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        usuarioController.usuarioEmail,
                        usuarioController.controllerEmail,
                        'e-mail',
                      ),
                      //child: Input(label: 'e-mail'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: input(
                        usuarioController.usuarioSenha,
                        usuarioController.controllerSenha,
                        'senha',
                      ),
                      //child: Input(label: 'senha'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                      child: Botao(
                        texto: 'Cadastrar',
                        cor: const Color(0xFF6BC8E4),
                        clicar: () async {
                          debugPrint('pls');
                          await usuarioController.saveProduto();

                          /*if (succes) {
                            Navigator.of(context).push<void>(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const HomePage(),
                              ),
                            );
                          }
                          ;*/
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
