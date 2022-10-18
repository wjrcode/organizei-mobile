import 'package:flutter/material.dart';
import 'package:organizei/Controller/DashboardController.dart';
import 'package:organizei/Repository/DashboardRepository.dart';
import 'package:organizei/components/card_item.dart';
import 'components/navigation/bottom_navigation_bar.dart';
import 'components/texto_contornado.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _HomePageState();
}

class _HomePageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    late DashboardController dashboardController;
    dashboardController = DashboardController(DashboardRepository(), context);

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
                            children: const <Widget>[
                              TextoContornado(
                                texto: 'Dashboard',
                                tamanho: 32,
                                cor: Color(0xFF6385C3),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 110),
                      child: Column(children: <Widget>[
                        FutureBuilder(
                            future: dashboardController.getDashboard(),
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

                              if (snapshot.data['dashboard'].length == 0) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 32.0),
                                    child: Text("Você não tem dashboard!"),
                                  ),
                                );
                              }

                              return ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data['dashboard'].length,
                                  itemBuilder: (context, index) {
                                    return cardItem(
                                      cor: Color(int.tryParse(
                                              snapshot.data['dashboard'][index]
                                                      ['cor'] ??
                                                  '0xFF6385C3') ??
                                          0),
                                      //nome: item.nome,
                                      horario: snapshot.data['dashboard'][index]
                                          ['msg'],
                                      dash: snapshot.data['dashboard'][index]
                                          ['dash'],
                                    );
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
          iconSelected: 'dashboard',
          fecharDialog: () {
            setState(() {});
          },
        )
        //
        );
  }
}
