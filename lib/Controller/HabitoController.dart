import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Habito/HabitoModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/HabitoRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class HabitoController extends Base {
  HabitoController(this.repository, this.context);

  final BuildContext context;
  final HabitoRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = HabitoModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  habitoId(int? value) => model.id = value;
  habitoIdRotina(int? value) => model.idRotina = value;
  habitoNome(String? value) => model.nome = value.toString();
  habitoDataehora(String? value) => model.data = value.toString();
  habitoDias(List<dynamic>? value) => model.dias = value!.cast<String>();
  habitoCor(String? value) => model.cor = value.toString();
  habitoDataFinal(String? value) => model.dataFinal = value.toString();

  var controllerNome = TextEditingController();
  var controllerDias = TextEditingController();
  var controllerPrioridade = TextEditingController();
  var controllerCor = TextEditingController();
  var controllerDataehora = TextEditingController();
  var controllerDataFinal = TextEditingController();

  Future<bool> saveHabito() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addHabito(model).then((value) async {
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
        return await repository.updateHabito(model).then((value) async {
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

  Future<List<HabitoModel>?> getHabitos() async {
    return await repository.getHabitos();
  }

  Future<bool> concluirHabito(bool concluido) async {
    try {
      return await repository
          .concluirHabito(model, concluido)
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

  Future<bool> excluirHabito() async {
    try {
      return await repository.excluirHabito(model).then((value) async {
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
