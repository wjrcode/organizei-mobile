import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:organizei/Model/Item/ItemModel.dart';
import 'package:organizei/Controller/Base/Base.dart';
import 'package:organizei/Repository/ItemRepository.dart';
import 'package:organizei/services/persistencia/login.configuracoes.dart';

class ItemController extends Base {
  ItemController(this.repository, this.context);

  final BuildContext context;
  final ItemRepository repository;
  final formKey = GlobalKey<FormState>();
  var model = ItemModel();
  //var loginConfiguracoes = LoginConfiguracoes();

  itemId(int? value) => model.id = value;
  itemNome(String? value) => model.nome = value.toString();
  itemConcluido(bool? value) => model.concluido = value;

  var controllerNome = TextEditingController();

  Future<bool> concluirItem(bool? concluido) async {
    try {
      return await repository
          .concluirItem(model, concluido!)
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

  Future<bool> excluirItem() async {
    try {
      return await repository.excluirItem(model).then((value) async {
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
