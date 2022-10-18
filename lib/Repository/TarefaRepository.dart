import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';

class TarefaRepository {
  Future<ResponseAPIModel> addTarefa(TarefaModel model) async {
    var json = {
      "nome": model.nome,
      "data": model.data,
      "observacao": model.observacao,
      "prioridade": model.prioridade,
      "cor": model.cor,
    };

    final response = await http.post(Uri.parse(ApiModel().ApiUrl + '/tarefas'),
        headers: await ApiModel().getHeaders(), body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateTarefa(TarefaModel model) async {
    var json = {
      "nome": model.nome,
      "data": model.data,
      "observacao": model.observacao,
      "prioridade": model.prioridade,
      "cor": model.cor,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl + '/tarefas/' + model.id.toString()),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> concluirTarefa(
      TarefaModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl +
            '/tarefas/' +
            model.id.toString() +
            '/concluir'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirTarefa(TarefaModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel().ApiUrl + '/tarefas/' + model.id.toString()),
        headers: await ApiModel().getHeaders());

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<List<TarefaModel>> getTarefas() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/tarefas');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    List<TarefaModel> listaTarefas = (jsonMap['tarefas'] as List)
        .map((item) => TarefaModel.fromJson(item))
        .toList();

    return listaTarefas;
  }

  Future<Map<String, dynamic>> get() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/tarefas');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }
}
