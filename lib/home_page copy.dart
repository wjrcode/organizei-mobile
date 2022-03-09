import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizei/components/card_item.dart';
import 'package:intl/intl.dart';

import 'components/texto_contornado.dart';

String getSaudacao() {
  int horaAtual = new DateTime.now().hour;

  if (horaAtual > 4 && horaAtual < 13) {
    return 'Bom dia,e';
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
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                      child: Column(
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
                            texto: 'Willian',
                            tamanho: 32,
                            cor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    cardItem(
                      cor: Colors.green[200],
                      nome: 'Pular corda',
                      horario: '07:30 até às 09:00',
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextoContornado(
                            texto: 'Hoje',
                            tamanho: 32,
                            cor: Colors.white,
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
                      cor: Colors.pink,
                      nome: 'Correr',
                      horario: '09:30 até às 10:00',
                    ),
                    cardItem(
                      cor: Colors.red,
                      nome: 'Estudar inglês',
                      horario: '13:00 até às 15:00',
                    ),
                    cardItem(
                      cor: Colors.purple,
                      nome: 'Tomar vitamina D',
                      horario: '15:00',
                    ),
                    cardItem(
                      cor: Colors.yellow,
                      nome: 'Pular corda',
                      horario: '07:30 até às 09:00',
                    ),
                    cardItem(
                      cor: Colors.lightBlue,
                      nome: 'Pular corda',
                      horario: '07:30 até às 09:00',
                    ),
                    cardItem(
                      cor: Color(0xFFFFEBEE),
                      nome: 'Pular corda',
                      horario: '07:30 até às 09:00',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
