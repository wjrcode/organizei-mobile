import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Lembrete/LembreteModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/LembreteRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class LembreteController extends Base {
  LembreteController(this.repository, this.context);

  final BuildContext context;
  final LembreteRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = LembreteModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  lembreteId(int? value) => model.id = value;
  lembreteNome(String? value) => model.nome = value.toString();
  lembreteDataehora(String? value) => model.data = value.toString();
  lembreteAniversario(bool? value) => model.eAniversario = value;
  lembreteCor(String? value) => model.cor = value.toString();

  var controllerNome = TextEditingController();
  var controllerCor = TextEditingController();
  var controllerDataehora = TextEditingController();

  Future<bool> saveLembrete() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addLembrete(model).then((value) async {
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

          await Future.delayed(const Duration(milliseconds: 500));

          if (value.valido!) {
            return value.valido!;
          } else {
            return false;
          }
        });
      } else {
        return await repository.updateLembrete(model).then((value) async {
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

          await Future.delayed(const Duration(milliseconds: 500));

          if (value.valido!) {
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

  Future<List<LembreteModel>?> getLembretes() async {
    return await repository.getLembretes();
  }

  Future<Map<String, dynamic>> get() async {
    return await repository.get();
  }

  Future<bool> concluirLembrete(bool concluido) async {
    try {
      return await repository
          .concluirLembrete(model, concluido)
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

        await Future.delayed(const Duration(milliseconds: 500));

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

  Future<bool> excluirLembrete() async {
    try {
      return await repository.excluirLembrete(model).then((value) async {
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

        await Future.delayed(const Duration(milliseconds: 500));

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
