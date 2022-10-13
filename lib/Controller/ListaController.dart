import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Item/ItemModel.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/ListaRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class ListaController extends Base {
  ListaController(this.repository, this.context);

  final BuildContext context;
  final ListaRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = ListaModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  listaId(int? value) => model.id = value;
  listaNome(String? value) => model.nome = value.toString();
  listaCor(String? value) => model.cor = value.toString();
  listaItens(List<ItemModel?>? value) => model.itens = value;

  var controllerNome = TextEditingController();
  var controllerCor = TextEditingController();

  Future<bool> saveLista() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    formKey.currentState!.save();

    try {
      if (model.id == null) {
        return await repository.addLista(model).then((value) async {
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
        return await repository.updateLista(model).then((value) async {
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

  Future<List<ListaModel>?> getListas() async {
    return await repository.getListas();
  }

  Future<bool> excluirLista() async {
    try {
      return await repository.excluirLista(model).then((value) async {
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
