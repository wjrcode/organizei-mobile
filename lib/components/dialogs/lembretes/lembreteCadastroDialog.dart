import 'package:flutter/material.dart';
import 'package:organizei/Model/Lembrete/LembreteModel.dart';
import 'package:organizei/Repository/LembreteRepository.dart';
import 'package:organizei/components/botao.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/input.dart';
import 'package:organizei/components/selectCor.dart';
import 'package:organizei/components/selectData.dart';
import 'package:organizei/components/selectPrioridade.dart';
import '../../../Controller/LembreteController.dart';

Future<dynamic> criarLembrete(BuildContext context,
    {LembreteModel? lembrete = null, Function? fecharDialog = null}) {
  late LembreteController lembreteController;

  lembreteController = LembreteController(LembreteRepository(), context);

  late bool? eAniversario = false;

  if (lembrete != null) {
    lembreteController.controllerNome.text = lembrete.nome ?? '';
    lembreteController.controllerDataehora.text = lembrete.data ?? '';
    lembreteController.lembreteAniversario(lembrete.eAniversario);
    eAniversario = lembrete.eAniversario;
    lembreteController.lembreteCor(lembrete.cor);
    lembreteController.lembreteId(lembrete.id);
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
                  key: lembreteController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: DialogPersonalizado(
                        nome: 'Lembrete',
                        child: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: input(
                              onSaved: lembreteController.lembreteNome,
                              textController: lembreteController.controllerNome,
                              label: 'nome',
                            ),
                          ),
                          SelectData(
                            controller: lembreteController.controllerDataehora,
                            onSaved: lembreteController.lembreteDataehora,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Checkbox(
                                  //tristate: true,
                                  activeColor: const Color(0xFF6385C3),
                                  side: const BorderSide(
                                      width: 2, color: Colors.black),
                                  value: eAniversario,
                                  onChanged: (bool? value) async {
                                    setState(() {
                                      eAniversario = value;
                                    });
                                  },
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text('é aniversário?'),
                              ),
                            ],
                          ),
                          SelectCor(
                              cor: lembreteController.lembreteCor,
                              corAtual: lembrete?.cor ?? ''),
                          Botao(
                            key: Key("keySalvarButton"),
                            texto: 'Salvar',
                            cor: const Color(0xFF6385C3),
                            clicar: () async {
                              lembreteController
                                  .lembreteAniversario(eAniversario);
                              bool succes =
                                  await lembreteController.saveLembrete();

                              if (succes == true) {
                                var nav = Navigator.of(context);
                                nav.pop();

                                if (lembrete?.id != null) {
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
            ),
          );
        });
      });
}
