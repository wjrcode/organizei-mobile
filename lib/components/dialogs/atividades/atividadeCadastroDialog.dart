import 'package:flutter/material.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Repository/AtividadeRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../../Controller/AtividadeController.dart';

Future<dynamic> criarAtividade(BuildContext context,
    {AtividadeModel? atividade = null,
    Function? fecharDialog = null,
    Function? addAtividade = null}) {
  late AtividadeController atividadeController;

  atividadeController = AtividadeController(AtividadeRepository(), context);

  if (atividade != null) {
    atividadeController.controllerNome.text = atividade.nome ?? '';
    atividadeController.controllerDataIncial.text = atividade.dataInicial ?? '';
    atividadeController.controllerDataFinal.text = atividade.dataFinal ?? '';
    atividadeController.controllerObservacao.text = atividade.observacao ?? '';
    atividadeController.controllerPrioridade.text = atividade.prioridade ?? '';
    atividadeController.atividadeCor(atividade.cor);
    atividadeController.atividadeId(atividade.id);
  }

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
                        nome: 'Atividade',
                        child: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: input(
                              onSaved: atividadeController.atividadeNome,
                              textController:
                                  atividadeController.controllerNome,
                              label: 'nome',
                            ),
                          ),
                          SelectData(
                            label: 'data inicial',
                            controller:
                                atividadeController.controllerDataIncial,
                            onSaved: atividadeController.atividadeDataInical,
                          ),
                          SelectData(
                            label: 'data final',
                            controller: atividadeController.controllerDataFinal,
                            onSaved: atividadeController.atividadeDataFinal,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: input(
                              onSaved: atividadeController.atividadeObservacao,
                              textController:
                                  atividadeController.controllerObservacao,
                              label: 'observação',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SelectPrioridade(
                                prioridade:
                                    atividadeController.atividadePrioridade,
                                prioridadeAtual: atividade?.prioridade ?? ''),
                          ),
                          SelectCor(
                            cor: atividadeController.atividadeCor,
                            corAtual: atividade?.cor ?? '',
                          ),
                          Botao(
                            texto: 'Salvar',
                            cor: const Color(0xFF6385C3),
                            clicar: () async {
                              bool succes = await atividadeController
                                  .saveAtividade(addAtividade);

                              if (succes == true) {
                                var nav = Navigator.of(context);
                                nav.pop();

                                if (atividade!.id != null) {
                                  //nav.pop();
                                  nav.pop();
                                }
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
            ),
          );
        });
      });
}
