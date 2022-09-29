import 'package:flutter/material.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/tarefaCadastroDialog.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../Controller/TarefaController.dart';

Future<dynamic> visualizarTarefa(BuildContext context,
    {required TarefaModel tarefa, Function? fecharDialog = null}) {
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
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 24),
                    child: DialogPersonalizado(
                      nome: tarefa.nome ?? '',
                      child: <Widget>[
                        Botao(
                          texto: 'Concluir',
                          cor: const Color(0xFF74C198),
                          clicar: () async {
                            // bool succes = await tarefaController.saveTarefa();

                            // if (succes == true) {
                            //   Navigator.pop(context);
                            //   fecharDialog!();
                            // }
                          },
                        ),
                        Botao(
                          texto: 'Editar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            Navigator.pop(context);
                            criarTarefa(context, tarefa: tarefa);

                            // bool succes = await tarefaController.saveTarefa();

                            // if (succes == true) {
                            //   Navigator.pop(context);
                            //   fecharDialog!();
                            // }
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
