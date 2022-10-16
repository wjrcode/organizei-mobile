import 'package:flutter/material.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';
import 'package:organizei/Repository/ProjetoRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../../Controller/ProjetoController.dart';

Future<dynamic> criarProjeto(BuildContext context,
    {ProjetoModel? projeto = null, Function? fecharDialog = null}) {
  late ProjetoController projetoController;

  projetoController = ProjetoController(ProjetoRepository(), context);

  if (projeto != null) {
    projetoController.controllerNome.text = projeto.nome ?? '';
    projetoController.controllerDataIncial.text = projeto.dataInicial ?? '';
    projetoController.controllerDataFinal.text = projeto.dataFinal ?? '';
    projetoController.controllerObservacao.text = projeto.observacao ?? '';
    projetoController.projetoCor(projeto.cor);
    projetoController.projetoId(projeto.id);
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
                              corAtual: projeto?.cor ?? ''),
                          Botao(
                            texto: 'Salvar',
                            cor: const Color(0xFF6385C3),
                            clicar: () async {
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
