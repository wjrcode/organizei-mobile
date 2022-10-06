import 'package:flutter/material.dart';
import 'package:organizei/Model/Habito/HabitoModel.dart';
import 'package:organizei/Repository/HabitoRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectDias.dart';
import '../../../Controller/HabitoController.dart';

Future<dynamic> criarHabito(BuildContext context,
    {HabitoModel? habito = null, Function? fecharDialog = null}) {
  late HabitoController habitoController;

  habitoController = HabitoController(HabitoRepository(), context);

  if (habito != null) {
    habitoController.controllerNome.text = habito.nome ?? '';
    habitoController.controllerDataehora.text = habito.data ?? '';
    habitoController.controllerDias.text = habito.dias.toString();
    habitoController.habitoCor(habito.cor);
    habitoController.habitoId(habito.id);
  }

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
                  key: habitoController.formKey,
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: MediaQuery.of(context).size.height,
                    child: DialogPersonalizado(
                      nome: 'Hábito',
                      child: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: input(
                            onSaved: habitoController.habitoNome,
                            textController: habitoController.controllerNome,
                            label: 'nome',
                          ),
                        ),
                        SelectData(
                          controller: habitoController.controllerDataehora,
                          onSaved: habitoController.habitoDataehora,
                          apenasHora: true,
                        ),
                        SelectDia(
                            dia: habitoController.habitoDias,
                            diaAtual: habito?.dias ??
                                ['0', '0', '0', '0', '0', '0', '0']),
                        SelectCor(
                            cor: habitoController.habitoCor,
                            corAtual: habito?.cor ?? ''),
                        Botao(
                          texto: 'Salvar',
                          cor: const Color(0xFF6385C3),
                          clicar: () async {
                            bool succes = await habitoController.saveHabito();

                            if (succes == true) {
                              var nav = Navigator.of(context);
                              nav.pop();

                              if (habito?.id != null) {
                                //nav.pop();
                                nav.pop();
                              }
                              fecharDialog!();
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

selectDias() {}
