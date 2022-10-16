import 'package:flutter/material.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/tarefas/tarefaCadastroDialog.dart';
import '../../../Controller/TarefaController.dart';

Future<dynamic> visualizarProjeto(BuildContext context,
    {required TarefaModel tarefa, Function? fecharDialog = null}) {
  late TarefaController tarefaController;
  tarefaController = TarefaController(TarefaRepository(), context);

  tarefaController.tarefaId(tarefa.id);

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
                  key: tarefaController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: DialogPersonalizado(
                        nome: tarefa.nome ?? '',
                        cor: tarefa.cor ?? '',
                        child: <Widget>[
                          Text(tarefa.observacao ?? ''),
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
                              Text(tarefa.data ?? ''),
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
                              Text(tarefa.prioridade ?? ''),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Concluir',
                              cor: const Color(0xFF74C198),
                              clicar: () async {
                                bool succes =
                                    await tarefaController.concluirTarefa(true);

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
                              criarTarefa(context,
                                  tarefa: tarefa, fecharDialog: fecharDialog);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Excluir',
                              cor: const Color(0xFFEF7E69),
                              clicar: () async {
                                bool succes =
                                    await tarefaController.excluirTarefa();

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
