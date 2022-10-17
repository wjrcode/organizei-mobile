import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizei/Controller/TarefaController.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Model/Habito/HabitoModel.dart';
import 'package:organizei/Model/Lembrete/LembreteModel.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/card_item.dart';
import 'package:intl/intl.dart';
import 'package:organizei/components/dialogs/atividades/atividadeDialog.dart';
import 'package:organizei/components/dialogs/habitos/habitoDialog.dart';
import 'package:organizei/components/dialogs/lembretes/lembreteDialog.dart';
import 'package:organizei/components/dialogs/login/entrarDialog.dart';
import 'package:organizei/components/dialogs/login/sairDialog.dart';
import 'package:organizei/components/dialogs/tarefas/tarefaDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/box.dart';
import 'components/navigation/bottom_navigation_bar.dart';
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
  late String? apelido = '';

  @override
  initState() {
    getApelido();
    super.initState();
  }

  getApelido() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      apelido = prefs.getString('UsuarioApelido');
    });
  }

  @override
  Widget build(BuildContext context) {
    late TarefaController tarefaController;
    tarefaController = TarefaController(TarefaRepository(), context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        backgroundColor: const Color(0xFF6BC8E4),
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
                      padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
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
                                  texto: apelido!,
                                  tamanho: 32,
                                  cor: const Color(0xFFF7BC36),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Icons.settings,
                                  size: 32,
                                ),
                                onTap: () {
                                  sair(context);
                                },
                              )
                              // Container(
                              //   width: 40,
                              //   height: 40,
                              //   decoration: BoxDecoration(
                              //       shape: BoxShape.circle,
                              //       color: Color(0xFFE9E9E9),
                              //       border: Border.all(
                              //         width: 3,
                              //         color: Colors.black,
                              //         style: BorderStyle.solid,
                              //       )),
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Box(
                      radius: 47,
                      padding: 110,
                      minHeight: MediaQuery.of(context).size.height * 0.808,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const TextoContornado(
                                  texto: 'Hoje ',
                                  tamanho: 32,
                                  cor: Color(0xFF6385C3),
                                ),
                                Text(
                                  ' ' + getDia(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          FutureBuilder(
                              future: tarefaController.get(),
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

                                if (snapshot.data.length == 0) {
                                  return const Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 32.0),
                                      child:
                                          Text("Você não tem nada pra fazer!"),
                                    ),
                                  );
                                }

                                return ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data['tarefas'].length,
                                    itemBuilder: (context, index) {
                                      var item;

                                      //var dialog;

                                      var tipo = snapshot.data['tarefas'][index]
                                          ['tipo'];
                                      if (tipo == 'tarefa') {
                                        item = TarefaModel.fromJson(
                                            snapshot.data['tarefas'][index]);
                                      }

                                      if (tipo == 'habito') {
                                        item = HabitoModel.fromJson(
                                            snapshot.data['tarefas'][index]);
                                      }

                                      if (tipo == 'lembrete') {
                                        item = LembreteModel.fromJson(
                                            snapshot.data['tarefas'][index]);
                                      }

                                      if (tipo == 'atividade') {
                                        item = AtividadeModel.fromJson(
                                            snapshot.data['tarefas'][index]);
                                      }
                                      return cardItem(
                                          cor: Color(int.tryParse(
                                                  item.cor ?? '0xFF6385C3') ??
                                              0),
                                          nome: item.nome,
                                          horario: snapshot.data['tarefas']
                                              [index]['dataFormatada'],
                                          abrirDialog: () {
                                            if (tipo == 'tarefa') {
                                              return visualizarTarefa(
                                                context,
                                                tarefa: item,
                                                fecharDialog: () {
                                                  setState(() {});
                                                },
                                              );
                                            } else if (tipo == 'habito') {
                                              return visualizarHabito(
                                                context,
                                                habito: item,
                                                fecharDialog: () {
                                                  setState(() {});
                                                },
                                              );
                                            } else if (tipo == 'lembrete') {
                                              return visualizarLembrete(
                                                context,
                                                lembrete: item,
                                                fecharDialog: () {
                                                  setState(() {});
                                                },
                                              );
                                            } else if (tipo == 'atividade') {
                                              return visualizarAtividade(
                                                context,
                                                atividade: item,
                                                fecharDialog: () {
                                                  setState(() {});
                                                },
                                              );
                                            }
                                          });
                                    });
                              }),
                        ]),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: ButtonNavigatorBar(
          fecharDialog: () {
            setState(() {});
          },
        )
        //
        );
  }
}
