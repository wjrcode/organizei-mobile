import 'package:flutter/material.dart';
import 'package:organizei/Controller/ItemController.dart';
import 'package:organizei/Model/Item/ItemModel.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';
import 'package:organizei/Repository/ItemRepository.dart';
import 'package:organizei/Repository/ListaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/listas/listaCadastroDialog.dart';
import '../../../Controller/ListaController.dart';

Future<dynamic> visualizarLista(BuildContext context,
    {required ListaModel lista, Function? fecharDialog = null}) {
  late ListaController listaController;
  late ItemController itemController;
  listaController = ListaController(ListaRepository(), context);
  itemController = ItemController(ItemRepository(), context);

  listaController.listaId(lista.id);

  var _pageSize = MediaQuery.of(context).size.height;
  var _notifySize = MediaQuery.of(context).padding.top;
  //var _appBarSize = appBar.preferredSize.height;

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
                    height: lista.itens!.length < 3
                        ? MediaQuery.of(context).size.height
                        : null,
                    // height: MediaQuery.of(context).size.height *
                    //     lista.itens!.length,

                    child: DialogPersonalizado(
                      nome: lista.nome ?? '',
                      cor: lista.cor ?? '',
                      child: <Widget>[
                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: lista.itens!.length,
                            itemBuilder: (context, index) {
                              var item = ItemModel(
                                id: lista.itens![index]!.id,
                                nome: lista.itens![index]!.nome,
                                concluido: lista.itens![index]!.concluido,
                              );

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Checkbox(
                                      //tristate: true,
                                      activeColor: Color(
                                          int.tryParse(lista.cor ?? '') ??
                                              0xFF6385C3),
                                      side: const BorderSide(
                                          width: 2, color: Colors.black),
                                      value: lista.itens![index]!.concluido,
                                      onChanged: (bool? value) async {
                                        setState(() {
                                          lista.itens![index]!.concluido =
                                              value;
                                        });
                                        itemController.itemId(item.id);
                                        await itemController.concluirItem(
                                            lista.itens![index]!.concluido);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Text(
                                        lista.itens![index]!.nome.toString()),
                                  ),
                                ],
                              );
                            }),
                        Botao(
                          texto: 'Editar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            criarLista(context,
                                lista: lista, fecharDialog: fecharDialog);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 16),
                          child: Botao(
                            texto: 'Excluir',
                            cor: const Color(0xFFEF7E69),
                            clicar: () async {
                              bool succes =
                                  await listaController.excluirLista();

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
          );
        });
      });
}
