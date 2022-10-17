import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/ProjetoRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class ProjetoController extends Base {
  ProjetoController(this.repository, this.context);

  final BuildContext context;
  final ProjetoRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = ProjetoModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  projetoId(int? value) => model.id = value;
  projetoNome(String? value) => model.nome = value.toString();
  projetoDataInical(String? value) => model.dataInicial = value.toString();
  projetoObservacao(String? value) => model.observacao = value.toString();
  projetoDataFinal(String? value) => model.dataFinal = value.toString();
  projetoCor(String? value) => model.cor = value.toString();
  projetoAtividades(List<AtividadeModel?>? value) => model.atividades = value;

  var controllerNome = TextEditingController();
  var controllerObservacao = TextEditingController();
  var controllerPrioridade = TextEditingController();
  var controllerCor = TextEditingController();
  var controllerDataIncial = TextEditingController();
  var controllerDataFinal = TextEditingController();

  Future<bool> saveProjeto() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addProjeto(model).then((value) async {
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
        return await repository.updateProjeto(model).then((value) async {
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

  Future<Map<String, dynamic>> getProjetos() async {
    return await repository.getProjetos();
  }

  Future<bool> concluirProjeto(bool concluido) async {
    try {
      return await repository
          .concluirProjeto(model, concluido)
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

  Future<bool> excluirProjeto() async {
    try {
      return await repository.excluirProjeto(model).then((value) async {
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
