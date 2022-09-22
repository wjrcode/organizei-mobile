import 'package:flutter/material.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../Controller/TarefaController.dart';

Future<dynamic> criarTarefa(BuildContext context) {
  late TarefaController tarefaController;
  //setState(() {
  tarefaController = TarefaController(TarefaRepository(), context);
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
                            prioridade: tarefaController.tarefaPrioridade),
                        SelectCor(cor: tarefaController.tarefaCor),
                        Botao(
                          texto: 'Cadastrar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            bool succes = await tarefaController.saveTarefa();

                            if (succes == true) {
                              Navigator.pop(context);
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
