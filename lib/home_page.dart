import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizei/components/card_item.dart';
import 'package:intl/intl.dart';

import 'components/bottom_navigation_bar.dart';
import 'components/texto_contornado.dart';

String getSaudacao() {
  int horaAtual = new DateTime.now().hour;

  if (horaAtual > 4 && horaAtual < 13) {
    return 'Bom dia,';
  } else if (horaAtual > 12 && horaAtual < 19) {
    return 'Boa tarde,';
  } else {
    return 'Boa Noite,';
  }
}

String getDia() {
  DateTime data = new DateTime.now();

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  return DateFormat.MMMMd().format(data);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    debugPrint(getDia());
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        extendBody: true,
        backgroundColor: Color(0xFF6BC8E4),
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                getSaudacao(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              TextoContornado(
                                texto: 'Willian!',
                                tamanho: 32,
                                cor: Color(0xFFF7BC36),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE9E9E9),
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height,
                      //color: Colors.white,
                      //padding: EdgeInsets.only(
                      // bottom: MediaQuery.of(context).size.height),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(47),
                          topLeft: Radius.circular(47),
                        ),
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height * 0.808,
                        ),
                        margin: EdgeInsets.only(top: 3, left: 3, right: 3),
                        padding: EdgeInsets.only(bottom: 110),
                        decoration: BoxDecoration(
                          color: Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(47),
                            topLeft: Radius.circular(47),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    TextoContornado(
                                      texto: 'Hoje ',
                                      tamanho: 32,
                                      cor: Color(0xFF6385C3),
                                    ),
                                    Text(
                                      ' ' + getDia(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              cardItem(
                                cor: Color(0xFF6385C3),
                                nome: 'Correr',
                                horario: '09:30 até às 10:00',
                              ),
                              cardItem(
                                cor: Color(0xFFEF7E69),
                                nome: 'Estudar inglês',
                                horario: '13:00 até às 15:00',
                              ),
                              cardItem(
                                cor: Color(0xFF6BC8E4),
                                nome: 'Tomar vitamina D e vitamna F',
                                horario: '15:00',
                              ),
                              cardItem(
                                cor: Color(0xFFF7BC36),
                                nome: 'Pular corda',
                                horario: '07:30 até às 09:00',
                              ),
                              cardItem(
                                cor: Color(0xFF74C198),
                                nome: 'Pular corda',
                                horario: '07:30 até às 09:00',
                              ),
                              cardItem(
                                cor: Color(0xFF6385C3),
                                nome: 'Pular corda',
                                horario: '07:30 até às 09:00',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
        floatingActionButton: ButtonNavigatorBar()
        //
        );
  }
}
