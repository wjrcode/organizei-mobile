import 'package:flutter/material.dart';
import 'package:organizei/Model/Item/ItemModel.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';
import 'package:organizei/Repository/ListaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import '../../../Controller/ListaController.dart';

Future<dynamic> criarLista(BuildContext context,
    {ListaModel? lista = null, Function? fecharDialog = null}) {
  late ListaController listaController;
  late List<TextEditingController> _controllers = [new TextEditingController()];

  listaController = ListaController(ListaRepository(), context);

  late List<ItemModel?>? itens = [ItemModel()];

  if (lista != null) {
    listaController.controllerNome.text = lista.nome ?? '';
    listaController.listaCor(lista.cor);
    listaController.listaId(lista.id);
    listaController.listaItens(lista.itens);

    itens = [];

    itens = lista.itens;

    _controllers = [];

    itens!.map((item) {
      var controllerNome = TextEditingController();
      controllerNome.text = (item!.nome ?? '');
      _controllers.add(controllerNome);
    }).toList();
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
                    height: itens!.length < 3
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
                              //var dialog;

                              // var controllerNomeItem = TextEditingController();

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: input(
                                  //onSaved: listaController.listaNome,
                                  textController: _controllers[index],
                                  label: 'item',
                                  excluir: true,
                                  funcao: () {
                                    setState(() {
                                      itens!.remove(itens[index]);
                                      _controllers.remove(_controllers[index]);
                                    });
                                  },
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
                                itens!.add(ItemModel());
                                _controllers.add(new TextEditingController());
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Botao(
                            texto: 'Salvar',
                            cor: const Color(0xFF6385C3),
                            clicar: () async {
                              List<ItemModel?>? listaitens = [];

                              _controllers.asMap().entries.map((item) {
                                listaitens.add(
                                  ItemModel(
                                      nome: (item.value.text),
                                      concluido: false,
                                      id: itens![item.key]!.id),
                                );
                              }).toList();

                              listaController.listaItens(listaitens);
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
