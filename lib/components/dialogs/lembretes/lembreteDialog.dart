import 'package:flutter/material.dart';
import 'package:organizei/Model/Lembrete/LembreteModel.dart';
import 'package:organizei/Repository/LembreteRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/lembretes/lembreteCadastroDialog.dart';
import '../../../Controller/LembreteController.dart';

Future<dynamic> visualizarLembrete(BuildContext context,
    {required LembreteModel lembrete, Function? fecharDialog = null}) {
  late LembreteController lembreteController;
  lembreteController = LembreteController(LembreteRepository(), context);

  lembreteController.lembreteId(lembrete.id);

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
                  key: lembreteController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: DialogPersonalizado(
                        nome: lembrete.nome ?? '',
                        cor: lembrete.cor ?? '',
                        child: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'data:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(lembrete.data ?? ''),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Concluir',
                              cor: const Color(0xFF74C198),
                              clicar: () async {
                                bool succes = await lembreteController
                                    .concluirLembrete(true);
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
                              criarLembrete(context,
                                  lembrete: lembrete,
                                  fecharDialog: fecharDialog);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Excluir',
                              cor: const Color(0xFFEF7E69),
                              clicar: () async {
                                bool succes =
                                    await lembreteController.excluirLembrete();

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
            ),
          );
        });
      });
}
