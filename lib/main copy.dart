import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizei/components/card_item.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    getSaudacao(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Text(
                    'Willian!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Hoje ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    getDia(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
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
