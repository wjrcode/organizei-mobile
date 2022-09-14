import 'package:flutter/material.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class TarefaController extends Base {
  TarefaController(this.repository, this.context);

  final BuildContext context;
  final TarefaRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = TarefaModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  tarefaNome(String? value) => model.nome = value.toString();
  tarefaDataehora(String? value) => model.data = value.toString();
  tarefaObservacao(String? value) => model.observacao = value.toString();
  tarefaPrioridade(String? value) => model.prioridade = value.toString();
  tarefaCor(String? value) => model.cor = value.toString();

  var controllerNome = TextEditingController();
  var controllerDataehora = TextEditingController();
  var controllerObservacao = TextEditingController();
  var controllerPrioridade = TextEditingController();
  var controllerCor = TextEditingController();

  Future<bool> saveTarefa() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addTarefa(model).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(value.msg!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
            backgroundColor: value.valido!
                ? const Color(0xFF74C198)
                : const Color(0xFFEF7E69),
          ));

          if (value.valido!) {
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        /*return await repository.updateProduto(model).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.msg),
            backgroundColor: value.valido ? Colors.green : Colors.red,
          ));
          return value.valido;
        });*/
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
