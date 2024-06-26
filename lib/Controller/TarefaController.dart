import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/TarefaRepository.dart';
import 'package:organizei/services/notificacao/notification_api.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class TarefaController extends Base {
  TarefaController(this.repository, this.context);

  final BuildContext context;
  final TarefaRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = TarefaModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  tarefaId(int? value) => model.id = value;
  tarefaNome(String? value) => model.nome = value.toString();
  tarefaDataehora(String? value) => model.data = value.toString();
  tarefaObservacao(String? value) => model.observacao = value.toString();
  tarefaPrioridade(String? value) => model.prioridade = value.toString();
  tarefaCor(String? value) => model.cor = value.toString();

  var controllerNome = TextEditingController();
  var controllerObservacao = TextEditingController();
  var controllerCor = TextEditingController();
  var controllerDataehora = TextEditingController();

  Future<bool> saveTarefa() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addTarefa(model).then((value) async {
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
            await NotificationApi.showScheduledNotification(
                id: value.id!,
                title: 'Oiê! tá na hora tá na hora de ' + model.nome!,
                body: '',
                scheduledDate: model.data);
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        return await repository.updateTarefa(model).then((value) async {
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
            await NotificationApi.showScheduledNotification(
                id: model.id ?? 0,
                title: 'Oiê! tá na hora tá na hora de ' + model.nome!,
                body: '',
                scheduledDate: model.data);
            return value.valido!;
          } else {
            return false;
          }
        });
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<TarefaModel>?> getTarefas() async {
    return await repository.getTarefas();
  }

  Future<Map<String, dynamic>> get() async {
    return await repository.get();
  }

  Future<bool> concluirTarefa(bool concluido) async {
    try {
      return await repository
          .concluirTarefa(model, concluido)
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
          NotificationApi.cancelScheduleNotification(model.id ?? 0);
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

  Future<bool> excluirTarefa() async {
    try {
      return await repository.excluirTarefa(model).then((value) async {
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
          NotificationApi.cancelScheduleNotification(model.id ?? 0);
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
