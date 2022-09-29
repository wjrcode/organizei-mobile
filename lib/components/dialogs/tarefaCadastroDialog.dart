import 'package:flutter/material.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../Controller/TarefaController.dart';

Future<dynamic> criarTarefa(BuildContext context,
    {TarefaModel? tarefa = null, Function? fecharDialog = null}) {
  late TarefaController tarefaController;
  //setState(() {
  tarefaController = TarefaController(TarefaRepository(), context);

  if (tarefa != null) {
    tarefaController.controllerNome.text = tarefa.nome ?? '';
    tarefaController.controllerDataehora.text = tarefa.data ?? '';
    tarefaController.controllerObservacao.text = tarefa.observacao ?? '';
    tarefaController.tarefaPrioridade(tarefa.prioridade);
    tarefaController.tarefaCor(tarefa.cor);
    tarefaController.tarefaId(tarefa.id);
  }

  // });

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
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: DialogPersonalizado(
                      nome: 'Tarefa',
                      child: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: tarefaController.tarefaNome,
                            textController: tarefaController.controllerNome,
                            label: 'nome',
                          ),
                        ),
                        SelectData(
                            controller: tarefaController.controllerDataehora,
                            onSaved: tarefaController.tarefaDataehora),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: tarefaController.tarefaObservacao,
                            textController:
                                tarefaController.controllerObservacao,
                            label: 'observação',
                          ),
                        ),
                        SelectPrioridade(
                            prioridade: tarefaController.tarefaPrioridade,
                            prioridadeAtual: tarefa?.prioridade ?? ''),
                        SelectCor(
                            cor: tarefaController.tarefaCor,
                            corAtual: tarefa?.cor ?? ''),
                        Botao(
                          texto: 'Salvar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            bool succes = await tarefaController.saveTarefa();

                            if (succes == true) {
                              Navigator.pop(context);
                              fecharDialog!();
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
      });
}
