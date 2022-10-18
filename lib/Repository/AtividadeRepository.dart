import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Atividade/AtividadeModel.dart';

class AtividadeRepository {
  Future<ResponseAPIModel> addAtividade(AtividadeModel model) async {
    var json = {
      "nome": model.nome,
      "dataInicial": model.dataInicial,
      "observacao": model.observacao,
      "dataFinal": model.dataFinal,
      "cor": model.cor,
      "prioridade": model.prioridade,
    };

    final response = await http.post(
        Uri.parse(ApiModel().ApiUrl + '/atividades'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateAtividade(AtividadeModel model) async {
    var json = {
      "nome": model.nome,
      "dataInicial": model.dataInicial,
      "observacao": model.observacao,
      "dataFinal": model.dataFinal,
      "cor": model.cor,
      "prioridade": model.prioridade,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl + '/atividades/' + model.id.toString()),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> concluirAtividade(
      AtividadeModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl +
            '/atividades/' +
            model.id.toString() +
            '/concluir'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirAtividade(AtividadeModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel().ApiUrl + '/atividades/' + model.id.toString()),
        headers: await ApiModel().getHeaders());

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<Map<String, dynamic>> getAtividades() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/atividades');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }

  Future<Map<String, dynamic>> get() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/atividades');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }
}
