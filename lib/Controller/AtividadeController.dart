import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/AtividadeRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class AtividadeController extends Base {
  AtividadeController(this.repository, this.context);

  final BuildContext context;
  final AtividadeRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = AtividadeModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  atividadeId(int? value) => model.id = value;
  atividadeNome(String? value) => model.nome = value.toString();
  atividadeDataInical(String? value) => model.dataInicial = value.toString();
  atividadeObservacao(String? value) => model.observacao = value.toString();
  atividadeDataFinal(String? value) => model.dataFinal = value.toString();
  atividadeCor(String? value) => model.cor = value.toString();
  atividadePrioridade(String? value) => model.prioridade = value.toString();

  var controllerNome = TextEditingController();
  var controllerObservacao = TextEditingController();
  var controllerPrioridade = TextEditingController();
  var controllerCor = TextEditingController();
  var controllerDataIncial = TextEditingController();
  var controllerDataFinal = TextEditingController();

  Future<bool> saveAtividade(Function? addAtividade) async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    if (addAtividade != null) {
      addAtividade(model);
    }

    try {
      if (model.id != null) {
        return await repository.updateAtividade(model).then((value) async {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 6.0,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
              content: Text(
                value.msg!,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: value.valido!
                  ? const Color(0xFF74C198)
                  : const Color(0xFFEF7E69),
            ),
          );

          await Future.delayed(const Duration(seconds: 1));

          if (value.valido!) {
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Map<String, dynamic>> getAtividades() async {
    return await repository.getAtividades();
  }

  Future<bool> concluirAtividade(bool concluido) async {
    try {
      return await repository
          .concluirAtividade(model, concluido)
          .then((value) async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(
              value.msg!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: value.valido!
                ? const Color(0xFF74C198)
                : const Color(0xFFEF7E69),
          ),
        );

        await Future.delayed(const Duration(seconds: 1));

        if (value.valido!) {
          return value.valido!;
        } else {
          return false;
        }
      });
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> excluirAtividade() async {
    try {
      return await repository.excluirAtividade(model).then((value) async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(
              value.msg!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: value.valido!
                ? const Color(0xFF74C198)
                : const Color(0xFFEF7E69),
          ),
        );

        await Future.delayed(const Duration(seconds: 1));

        if (value.valido!) {
          return value.valido!;
        } else {
          return false;
        }
      });
    } catch (e) {
      print(e);
      return false;
    }
  }
}
