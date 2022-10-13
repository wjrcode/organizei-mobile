import 'package:flutter/material.dart';
import 'package:organizei/Model/Item/ItemModel.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';
import 'package:organizei/Repository/ListaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../../Controller/ListaController.dart';

Future<dynamic> criarLista(BuildContext context,
    {ListaModel? lista = null, Function? fecharDialog = null}) {
  late ListaController listaController;

  listaController = ListaController(ListaRepository(), context);

  late List<ItemModel?>? itens = [ItemModel()];

  if (lista != null) {
    listaController.controllerNome.text = lista.nome ?? '';
    listaController.listaCor(lista.cor);
    listaController.listaId(lista.id);
    listaController.listaItens(lista.itens);
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
                  key: listaController.formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: itens.length < 3
                        ? MediaQuery.of(context).size.height
                        : null,
                    child: DialogPersonalizado(
                      nome: 'Lista',
                      child: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: listaController.listaNome,
                            textController: listaController.controllerNome,
                            label: 'nome',
                          ),
                        ),
                        SelectCor(
                            cor: listaController.listaCor,
                            corAtual: lista?.cor ?? ''),
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: itens.length,
                            itemBuilder: (context, index) {
                              var item;

                              //var dialog;

                              var controllerNomeItem = TextEditingController();

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: input(
                                  //onSaved: listaController.listaNome,
                                  textController: controllerNomeItem,
                                  label: 'item',
                                ),
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Botao(
                            texto: 'Novo item',
                            cor: const Color(0xFF6BC8E4),
                            clicar: () async {
                              setState(() {
                                itens.add(ItemModel());
                              });

                              // bool succes = await listaController.saveLista();

                              // if (succes == true) {
                              //   var nav = Navigator.of(context);
                              //   nav.pop();

                              //   if (lista?.id != null) {
                              //     //nav.pop();
                              //     nav.pop();
                              //   }
                              //   fecharDialog!();
                              // }
                            },
                          ),
                        ),
                        Botao(
                          texto: 'Salvar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            bool succes = await listaController.saveLista();

                            if (succes == true) {
                              var nav = Navigator.of(context);
                              nav.pop();

                              if (lista?.id != null) {
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
          );
        });
      });
}
