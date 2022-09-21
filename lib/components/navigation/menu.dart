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
    setState(() {
      tarefaController = TarefaController(TarefaRepository(), context);
    });
    List<int> cores = [
      0xFF6385C3,
      0xFFEF7E69,
      0xFF6BC8E4,
      0xFFF7BC36,
      0xFF74C198
    ];

    late int corSelected = 0;

    DateTime date = new DateTime.now();
    final horas = date.hour.toString();
    final horasf = horas.padLeft(2, '0');
    final minutos = date.minute.toString();
    final minutosf = minutos.padLeft(2, '0');

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
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 16),
                          //   child: input(
                          //     onSaved: tarefaController.tarefaDataehora,
                          //     textController:
                          //         tarefaController.controllerDataehora,
                          //     label: 'data e hora',
                          //   ),
                          // ),
                          Botao(
                              texto: 'data',
                              cor: const Color(0xFF6385C3),
                              clicar: () async {
                                DateTime? newDate = await veipls(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2100),
                                    builder: (BuildContext context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Color(0xFF6385C3),
                                          ),
                                          dialogTheme: DialogTheme(
                                            backgroundColor: Color(0xFFE9E9E9),
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 3,
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.circular(
                                                  16.0), // this is the border radius of the picker
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    });

                                if (newDate == null) return;

                                final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: date.hour, minute: date.minute),
                                    builder: (BuildContext context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                            timePickerTheme:
                                                TimePickerThemeData(
                                              shape: RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    width: 3,
                                                    color: Colors.black),
                                                borderRadius: BorderRadius.circular(
                                                    16.0), // this is the border radius of the picker
                                              ),
                                              backgroundColor:
                                                  Color(0xFFE9E9E9),
                                              hourMinuteColor:
                                                  MaterialStateColor.resolveWith(
                                                      (states) => states
                                                              .contains(
                                                                  MaterialState
                                                                      .selected)
                                                          ? Color(0xFFE9E9E9)
                                                          : Color(0xFFE9E9E9)),
                                              dialHandColor: Color(0xFFE9E9E9),
                                              dialTextColor: MaterialStateColor
                                                  .resolveWith((states) =>
                                                      states.contains(
                                                              MaterialState
                                                                  .selected)
                                                          ? Colors.black
                                                          : Colors.black),
                                              hourMinuteTextColor:
                                                  MaterialStateColor.resolveWith(
                                                      (states) => states
                                                              .contains(
                                                                  MaterialState
                                                                      .selected)
                                                          ? Color(0xFF6385C3)
                                                          : Colors.black),
                                              dialBackgroundColor:
                                                  Color(0xFF6385C3),
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                                    style: ButtonStyle(
                                                        foregroundColor:
                                                            MaterialStateColor
                                                                .resolveWith(
                                                                    (states) =>
                                                                        Color(
                                                                            0xFF6385C3)),
                                                        overlayColor:
                                                            MaterialStateColor
                                                                .resolveWith(
                                                          (states) =>
                                                              Color(0xFF6385C3),
                                                        )))),
                                        child: child!,
                                      );
                                    });

                                if (time == null) return;

                                final newDateTime = DateTime(
                                  date.year,
                                  date.month,
                                  date.day,
                                  time.hour,
                                  time.minute,
                                );

                                setState(() {
                                  date = newDate;
                                });

                                tarefaController
                                    .tarefaDataehora(newDateTime.toString());
                              }),
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
                          const Text(
                            'cor',
                            style: TextStyle(
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
                                    children: cores.map((strone) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            corSelected = strone;
                                          });
                                          tarefaController.tarefaCor(
                                              corSelected.toString());
                                        },
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(strone),
                                              border: Border.all(
                                                width: corSelected == strone
                                                    ? 5
                                                    : 3,
                                                color: corSelected == strone
                                                    ? Colors.white
                                                    : Colors.black,
                                                style: BorderStyle.solid,
                                              )),
                                        ),
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
        });
  }
}

Future<DateTime?> veipls({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
  DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
  SelectableDayPredicate? selectableDayPredicate,
  String? helpText,
  String? cancelText,
  String? confirmText,
  Locale? locale,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TextDirection? textDirection,
  TransitionBuilder? builder,
  DatePickerMode initialDatePickerMode = DatePickerMode.day,
  String? errorFormatText,
  String? errorInvalidText,
  String? fieldHintText,
  String? fieldLabelText,
  TextInputType? keyboardType,
  Offset? anchorPoint,
}) async {
  assert(context != null);
  assert(initialDate != null);
  assert(firstDate != null);
  assert(lastDate != null);
  initialDate = DateUtils.dateOnly(initialDate);
  firstDate = DateUtils.dateOnly(firstDate);
  lastDate = DateUtils.dateOnly(lastDate);
  assert(
    !lastDate.isBefore(firstDate),
    'lastDate $lastDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isBefore(firstDate),
    'initialDate $initialDate must be on or after firstDate $firstDate.',
  );
  assert(
    !initialDate.isAfter(lastDate),
    'initialDate $initialDate must be on or before lastDate $lastDate.',
  );
  assert(
    selectableDayPredicate == null || selectableDayPredicate(initialDate),
    'Provided initialDate $initialDate must satisfy provided selectableDayPredicate.',
  );
  assert(initialEntryMode != null);
  assert(useRootNavigator != null);
  assert(initialDatePickerMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  Widget dialog = DatePickerDialog(
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    currentDate: currentDate,
    initialEntryMode: initialEntryMode,
    selectableDayPredicate: selectableDayPredicate,
    helpText: helpText,
    cancelText: cancelText,
    confirmText: confirmText,
    initialCalendarMode: initialDatePickerMode,
    errorFormatText: errorFormatText,
    errorInvalidText: errorInvalidText,
    fieldHintText: fieldHintText,
    fieldLabelText: fieldLabelText,
    keyboardType: keyboardType,
  );

  if (textDirection != null) {
    dialog = Directionality(
      textDirection: textDirection,
      child: dialog,
    );
  }

  if (locale != null) {
    dialog = Localizations.override(
      context: context,
      locale: locale,
      child: dialog,
    );
  }

  return showDialog<DateTime>(
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    context: context,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    anchorPoint: anchorPoint,
  );
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
