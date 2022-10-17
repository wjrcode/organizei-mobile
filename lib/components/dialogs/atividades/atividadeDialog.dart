import 'package:flutter/material.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Repository/AtividadeRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/atividades/atividadeCadastroDialog.dart';
import '../../../Controller/AtividadeController.dart';

Future<dynamic> visualizarAtividade(
  BuildContext context, {
  required AtividadeModel atividade,
  Function? fecharDialog = null,
  Function? addAtividade,
  Function? deleteAtividade,
}) {
  late AtividadeController atividadeController;
  atividadeController = AtividadeController(AtividadeRepository(), context);

  atividadeController.atividadeId(atividade.id);

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
                  key: atividadeController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: DialogPersonalizado(
                        nome: atividade.nome ?? '',
                        cor: atividade.cor ?? '',
                        child: <Widget>[
                          Text(atividade.observacao ?? ''),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'data inicial:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(atividade.dataInicial ?? ''),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'data final:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(atividade.dataFinal ?? ''),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'prioridade:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(atividade.prioridade ?? ''),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Concluir',
                              cor: const Color(0xFF74C198),
                              clicar: () async {
                                bool succes = await atividadeController
                                    .concluirAtividade(true);

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
                              //Navigator.pop(context);
                              criarAtividade(context,
                                  atividade: atividade,
                                  addAtividade: addAtividade,
                                  fecharDialog: fecharDialog);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Excluir',
                              cor: const Color(0xFFEF7E69),
                              clicar: () async {
                                bool succes = await atividadeController
                                    .excluirAtividade();

                                if (succes == true) {
                                  deleteAtividade!();
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
