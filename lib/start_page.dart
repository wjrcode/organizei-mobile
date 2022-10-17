import 'package:flutter/material.dart';
import 'package:organizei/Controller/LoginController.dart';
import 'package:organizei/Controller/UsuarioController.dart';
import 'package:organizei/Repository/LoginRepository.dart';
import 'package:organizei/Repository/UsuarioRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';
import 'package:organizei/components/dialogs/login/usuarioCadastroDialog.dart';
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
                  cadastrarUsuario(context);
                },
              ),
            ]),
      )),
    );
  }
}
