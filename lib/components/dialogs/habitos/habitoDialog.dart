import 'package:flutter/material.dart';
import 'package:organizei/Model/Habito/HabitoModel.dart';
import 'package:organizei/Repository/HabitoRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/habitos/habitoCadastroDialog.dart';
import '../../../Controller/HabitoController.dart';

Future<dynamic> visualizarHabito(BuildContext context,
    {required HabitoModel habito, Function? fecharDialog = null}) {
  late HabitoController habitoController;
  habitoController = HabitoController(HabitoRepository(), context);

  habitoController.habitoId(habito.id);

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
                child: Form(
                  key: habitoController.formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 24),
                    child: DialogPersonalizado(
                      nome: habito.nome ?? '',
                      cor: habito.cor ?? '',
                      child: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 16),
                          child: Botao(
                            texto: 'Concluir',
                            cor: const Color(0xFF74C198),
                            clicar: () async {
                              bool succes =
                                  await habitoController.concluirHabito(true);

                              if (succes == true) {
                                Navigator.pop(context);
                                fecharDialog!();
                              }
                            },
                          ),
                        ),
                        Botao(
                          texto: 'Editar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            criarHabito(context,
                                habito: habito, fecharDialog: fecharDialog);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 16),
                          child: Botao(
                            texto: 'Excluir',
                            cor: const Color(0xFFEF7E69),
                            clicar: () async {
                              bool succes =
                                  await habitoController.excluirHabito();

                              if (succes == true) {
                                Navigator.pop(context);
                                fecharDialog!();
                              }
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
