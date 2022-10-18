import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Lista/ListaModel.dart';

import '../Model/Item/ItemModel.dart';

class ListaRepository {
  Future<ResponseAPIModel> addLista(ListaModel model) async {
    var json = {"nome": model.nome, "cor": model.cor, "itens": model.itens};

    final response = await http.post(Uri.parse(ApiModel().ApiUrl + '/listas'),
        headers: await ApiModel().getHeaders(), body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateLista(ListaModel model) async {
    var json = {"nome": model.nome, "cor": model.cor, "itens": model.itens};

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl + '/listas/' + model.id.toString()),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirLista(ListaModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel().ApiUrl + '/listas/' + model.id.toString()),
        headers: await ApiModel().getHeaders());

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<Map<String, dynamic>> getListas() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/listas');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    // List<ListaModel> listaProdutos = (jsonMap['listas'] as List)
    //     .map((item) => ListaModel.fromJson(item))
    //     .toList();

    return jsonMap;
  }
}
