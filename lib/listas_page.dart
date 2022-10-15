import 'package:flutter/material.dart';
import 'package:organizei/Controller/ListaController.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';
import 'package:organizei/Repository/ListaRepository.dart';
import 'package:organizei/components/card_item.dart';
import 'package:organizei/components/dialogs/listas/listaDialog.dart';
import 'components/navigation/bottom_navigation_bar.dart';
import 'components/texto_contornado.dart';

class ListasPage extends StatefulWidget {
  const ListasPage({Key? key}) : super(key: key);

  @override
  State<ListasPage> createState() => _HomePageState();
}

class _HomePageState extends State<ListasPage> {
  late String? apelido = '';

  @override
  Widget build(BuildContext context) {
    late ListaController listaController;
    listaController = ListaController(ListaRepository(), context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        backgroundColor: const Color(0xFFE9E9E9),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 80.0, 24.0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextoContornado(
                                texto: 'Listas',
                                tamanho: 32,
                                cor: const Color(0xFF6385C3),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0.0),
                      child: Column(children: <Widget>[
                        FutureBuilder(
                            future: listaController.getListas(),
                            builder: (context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              if (snapshot.hasError) {
                                return const Center(
                                  child: Text('Ocorreu um erro!'),
                                );
                              }

                              if (snapshot.data['listas'].length == 0) {
                                return const Center(
                                  child:
                                      Text("Você não tem nada pra fazer hoje!"),
                                );
                              }

                              return ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data['listas'].length,
                                  itemBuilder: (context, index) {
                                    var item = ListaModel.fromJson(
                                      snapshot.data['listas'][index],
                                    );

                                    return cardItem(
                                        cor: Color(int.tryParse(
                                                item.cor ?? '0xFF6385C3') ??
                                            0),
                                        nome: item.nome,
                                        horario: '',
                                        abrirDialog: () {
                                          return visualizarLista(
                                            context,
                                            lista: item,
                                            fecharDialog: () {
                                              setState(() {});
                                            },
                                          );
                                        });
                                  });
                            }),
                      ]),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: ButtonNavigatorBar(
          iconSelected: 'listas',
          fecharDialog: () {
            setState(() {});
          },
        )
        //
        );
  }
}
