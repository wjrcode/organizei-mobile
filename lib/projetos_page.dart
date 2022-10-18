import 'package:flutter/material.dart';
import 'package:organizei/Controller/ProjetoController.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';
import 'package:organizei/Repository/ProjetoRepository.dart';
import 'package:organizei/components/card_item.dart';
import 'package:organizei/components/dialogs/projetos/projetoDialog.dart';
import 'components/navigation/bottom_navigation_bar.dart';
import 'components/texto_contornado.dart';

class ProjetosPage extends StatefulWidget {
  const ProjetosPage({Key? key}) : super(key: key);

  @override
  State<ProjetosPage> createState() => _HomePageState();
}

class _HomePageState extends State<ProjetosPage> {
  late String? apelido = '';

  @override
  Widget build(BuildContext context) {
    late ProjetoController listaController;
    listaController = ProjetoController(ProjetoRepository(), context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        backgroundColor: const Color(0xFFE9E9E9),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
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
                              children: const <Widget>[
                                TextoContornado(
                                  texto: 'Projetos',
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
                              future: listaController.getProjetos(),
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

                                if (snapshot.data['projetos'].length == 0) {
                                  return const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 32.0),
                                      child: Text("Você não tem projetos!"),
                                    ),
                                  );
                                }

                                return ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data['projetos'].length,
                                    itemBuilder: (context, index) {
                                      var item = ProjetoModel.fromJson(
                                        snapshot.data['projetos'][index],
                                      );

                                      return cardItem(
                                          cor: Color(int.tryParse(
                                                  item.cor ?? '0xFF6385C3') ??
                                              0),
                                          nome: item.nome,
                                          horario: '',
                                          abrirDialog: () {
                                            return visualizarProjeto(
                                              context,
                                              projeto: item,
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
        ),
        floatingActionButton: ButtonNavigatorBar(
          iconSelected: 'projetos',
          fecharDialog: () {
            setState(() {});
          },
        )
        //
        );
  }
}
