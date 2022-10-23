import 'package:flutter/material.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';
import 'package:organizei/Repository/ProjetoRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/card_item.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/atividades/atividadeCadastroDialog.dart';
import 'package:organizei/components/dialogs/atividades/atividadeDialog.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../../Controller/ProjetoController.dart';

Future<dynamic> criarProjeto(
  BuildContext context, {
  ProjetoModel? projeto = null,
  Function? fecharDialog = null,
}) {
  late ProjetoController projetoController;

  projetoController = ProjetoController(ProjetoRepository(), context);

  late List<AtividadeModel?>? atividades = [];

  if (projeto != null) {
    projetoController.controllerNome.text = projeto.nome ?? '';
    projetoController.controllerDataIncial.text = projeto.dataInicial ?? '';
    projetoController.controllerDataFinal.text = projeto.dataFinal ?? '';
    projetoController.controllerObservacao.text = projeto.observacao ?? '';
    projetoController.projetoCor(projeto.cor);
    projetoController.projetoId(projeto.id);
    projetoController.projetoAtividades(projeto.atividades);

    atividades = projeto.atividades;
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
                  key: projetoController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: DialogPersonalizado(
                        nome: 'Projeto',
                        child: <Widget>[
                          const Text('*Todos os campos são obrigatórios'),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: input(
                              onSaved: projetoController.projetoNome,
                              textController: projetoController.controllerNome,
                              label: 'nome',
                            ),
                          ),
                          SelectData(
                            label: 'data inicial',
                            tipo: 'data',
                            controller: projetoController.controllerDataIncial,
                            onSaved: projetoController.projetoDataInical,
                          ),
                          SelectData(
                            label: 'data final',
                            tipo: 'data',
                            controller: projetoController.controllerDataFinal,
                            onSaved: projetoController.projetoDataFinal,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: input(
                              onSaved: projetoController.projetoObservacao,
                              textController:
                                  projetoController.controllerObservacao,
                              label: 'observação',
                            ),
                          ),
                          SelectCor(
                            cor: projetoController.projetoCor,
                            corAtual: projeto?.cor ?? '',
                          ),
                          ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: atividades!.length,
                              itemBuilder: (context, index) {
                                return cardItem(
                                    cor: Color(int.tryParse(
                                            atividades![index]!.cor ??
                                                '0xFF6385C3') ??
                                        0),
                                    nome: atividades[index]!.nome ?? '',
                                    horario: '',
                                    abrirDialog: () {
                                      return visualizarAtividade(
                                        context,
                                        atividade: atividades![index]!,
                                        addAtividade: (atividade) {
                                          setState((() {
                                            atividades![index] = atividade;
                                          }));
                                        },
                                        fecharDialog: fecharDialog,
                                        deleteAtividade: () {
                                          setState(() {
                                            atividades!
                                                .remove(atividades[index]);
                                          });
                                        },
                                      );
                                    });
                              }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Botao(
                              texto: 'Adicionar atividade',
                              cor: const Color(0xFF6BC8E4),
                              clicar: () async {
                                atividades!.add(AtividadeModel());
                                criarAtividade(
                                  context,
                                  atividade: atividades[atividades.length - 1],
                                  addAtividade: (atividade) {
                                    setState((() {
                                      atividades![atividades.length - 1] =
                                          atividade;
                                    }));
                                  },
                                  fecharDialog: fecharDialog,
                                );
                              },
                            ),
                          ),
                          Botao(
                            key: Key("keySalvarButton"),
                            texto: 'Salvar',
                            cor: const Color(0xFF6385C3),
                            clicar: () async {
                              projetoController.projetoAtividades(atividades);
                              bool succes =
                                  await projetoController.saveProjeto();

                              if (succes == true) {
                                var nav = Navigator.of(context);
                                nav.pop();

                                if (projeto?.id != null) {
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
