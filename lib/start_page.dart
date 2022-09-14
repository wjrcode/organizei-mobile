import 'package:flutter/material.dart';
import 'package:organizei/Controller/LoginController.dart';
import 'package:organizei/Controller/UsuarioController.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late LoginController controller;
  late UsuarioController usuarioController;
  late String? apelido;

  @override
  initState() {
    controller = LoginController(LoginRepository(), context);
    usuarioController = UsuarioController(UsuarioRepository(), context);
    _logar();
    super.initState();
  }

  _logar() async {
    await controller.getLogin().then((value) async {
      if (value != null) {
        String teste = await controller.getUsuarioLogado();
        String senha = await controller.getSenhaUsuarioLogado();

        SharedPreferences prefs = await SharedPreferences.getInstance();

        apelido = prefs.getString('UsuarioApelido');

        controller.controllerUsuario.text = teste.toString();
        controller.controllerSenha.text = senha.toString();
      }
    });
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
                texto: 'Cadastrar',
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
    setState(() {});
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
                      key: controller.formKey,
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        height: MediaQuery.of(context).size.height,
                        child: DialogPersonalizado(
                          nome: 'Login',
                          //minHeight: MediaQuery.of(context).size.height * 0.8,
                          child: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: input(
                                onSaved: controller.loginUsuario,
                                textController: controller.controllerUsuario,
                                label: 'e-mail',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: input(
                                  onSaved: controller.loginSenha,
                                  textController: controller.controllerSenha,
                                  label: 'senha',
                                  senha: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
                              child: Botao(
                                texto: 'Entrar',
                                cor: const Color(0xFF6BC8E4),
                                clicar: () async {
                                  bool succes = await controller.autentica();
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();

                                  apelido = prefs.getString('UsuarioApelido');

                                  if (succes) {
                                    Navigator.of(context).push<void>(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            HomePage(apelido: apelido),
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
              ));
        });
  }

  Future<dynamic> cadastrar(BuildContext context) {
    setState(() {
      usuarioController = UsuarioController(UsuarioRepository(), context);
    });
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
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 24),
                    child: DialogPersonalizado(
                      nome: 'Cadastro',
                      //minHeight: MediaQuery.of(context).size.height * 0.8,
                      child: <Widget>[
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
                              label: 'senha',
                              senha: true),
                          //child: Input(label: 'senha'),
                        ),
                        Botao(
                          texto: 'Cadastrar',
                          cor: const Color(0xFF6BC8E4),
                          clicar: () async {
                            bool succes = await usuarioController.saveUsuario();

                            if (succes == true) {
                              Navigator.pop(context);
                              entrar(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
