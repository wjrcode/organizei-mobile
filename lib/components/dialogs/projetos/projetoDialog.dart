import 'package:flutter/material.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';
import 'package:organizei/Repository/ProjetoRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/projetos/projetoCadastroDialog.dart';
import '../../../Controller/ProjetoController.dart';

Future<dynamic> visualizarProjeto(BuildContext context,
    {required ProjetoModel projeto, Function? fecharDialog = null}) {
  late ProjetoController projetoController;
  projetoController = ProjetoController(ProjetoRepository(), context);

  projetoController.projetoId(projeto.id);

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
                        nome: projeto.nome ?? '',
                        cor: projeto.cor ?? '',
                        child: <Widget>[
                          Text(projeto.observacao ?? ''),
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
                              Text(projeto.dataInicial ?? ''),
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
                              Text(projeto.dataFinal ?? ''),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'progresso:  ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(''),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Concluir',
                              cor: const Color(0xFF74C198),
                              clicar: () async {
                                bool succes = await projetoController
                                    .concluirProjeto(true);

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
                              criarProjeto(context,
                                  projeto: projeto, fecharDialog: fecharDialog);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16, top: 16),
                            child: Botao(
                              texto: 'Excluir',
                              cor: const Color(0xFFEF7E69),
                              clicar: () async {
                                bool succes =
                                    await projetoController.excluirProjeto();

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
