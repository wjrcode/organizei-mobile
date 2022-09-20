import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/box.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/texto_contornado.dart';
import 'package:organizei/home_page.dart';

import '../../Controller/TarefaController.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, this.customFunction}) : super(key: key);

  final customFunction;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late TarefaController tarefaController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            border: Border.all(
              width: 3,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
            color: Color(0xFFF7BC36),
          ),
          //width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.customFunction();
                  showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.white.withOpacity(0),
                      context: context,
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.only(top: 24),
                          child: DialogPersonalizado(
                            nome: 'Lista',
                            //minHeight: MediaQuery.of(context).size.height * 0.8,
                            child: <Widget>[
                              Text(
                                'nome',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Material(
                                color: Colors.white.withOpacity(0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),

                                    //labelText: 'Password',
                                  ),
                                ),
                              ),
                              Text(
                                'item',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Material(
                                color: Colors.white.withOpacity(0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),

                                    //labelText: 'Password',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: 60,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              width: 3, color: Colors.black)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFF6385C3)),
                                    ),
                                    child: Text(
                                      'SALVAR',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: AbsorbPointer(
                  //width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'criar lista',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  criarTarefa(context);
                },
                child: AbsorbPointer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'criar tarefa',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'criar hábito',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'criar projeto',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'criar lembrete',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> criarTarefa(BuildContext context) {
    List<int> strs = [
      0xFF6385C3,
      0xFFEF7E69,
      0xFF6BC8E4,
      0xFFF7BC36,
      0xFF74C198
    ];
    setState(() {
      tarefaController = TarefaController(TarefaRepository(), context);
    });
    return showDialog(
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Material(
                type: MaterialType.transparency,
                child: Form(
                  key: tarefaController.formKey,
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 24),
                    child: DialogPersonalizado(
                      nome: 'Tarefa',
                      //minHeight: MediaQuery.of(context).size.height * 0.8,
                      child: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: tarefaController.tarefaNome,
                            textController: tarefaController.controllerNome,
                            label: 'nome',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: tarefaController.tarefaDataehora,
                            textController:
                                tarefaController.controllerDataehora,
                            label: 'data e hora',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: tarefaController.tarefaObservacao,
                            textController:
                                tarefaController.controllerObservacao,
                            label: 'observação',
                          ),
                          //child: Input(label: 'observação'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'prioridade',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              DropdownButtonExample(
                                  tarefaController: tarefaController),
                            ],
                          ),
                          //child: Input(label: 'senha'),
                        ),
                        Text(
                          'cor',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ListView(
                                  itemExtent: 70.0,
                                  scrollDirection: Axis.horizontal,
                                  children: strs.map((strone) {
                                    return Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(strone),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                          )),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )),
                        // Container(
                        //   height: 200,
                        // ),
                        Botao(
                          texto: 'Cadastrar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            bool succes = await tarefaController.saveTarefa();

                            if (succes == true) {
                              Navigator.pop(context);
                              //entrar(context);
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
  }
}

const List<String> list = <String>['baixa', 'média', 'alta'];

class DropdownButtonExample extends StatefulWidget {
  late TarefaController? tarefaController;
  DropdownButtonExample({Key? key, this.tarefaController}) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(20),
      icon: const Icon(Icons.expand_more),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onSaved: widget.tarefaController!.tarefaPrioridade,
      value: dropdownValue,
      elevation: 16,
      style: const TextStyle(color: Colors.grey),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
