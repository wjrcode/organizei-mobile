import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Lembrete/LembreteModel.dart';

class LembreteRepository {
  Future<ResponseAPIModel> addLembrete(LembreteModel model) async {
    var json = {
      "nome": model.nome,
      "data": model.data,
      "eAniversario": model.eAniversario,
      "cor": model.cor,
    };

    final response = await http.post(
        Uri.parse(ApiModel().ApiUrl + '/lembretes'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateLembrete(LembreteModel model) async {
    var json = {
      "nome": model.nome,
      "data": model.data,
      "eAniversario": model.eAniversario,
      "cor": model.cor,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl + '/lembretes/' + model.id.toString()),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirLembrete(LembreteModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel().ApiUrl + '/lembretes/' + model.id.toString()),
        headers: await ApiModel().getHeaders());

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<List<LembreteModel>> getLembretes() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/lembretes');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    List<LembreteModel> listaLembretes = (jsonMap['lembretes'] as List)
        .map((item) => LembreteModel.fromJson(item))
        .toList();

    return listaLembretes;
  }

  Future<ResponseAPIModel> concluirLembrete(
      LembreteModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(ApiModel().ApiUrl +
            '/lembretes/' +
            model.id.toString() +
            '/concluir'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<Map<String, dynamic>> get() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/lembretes');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }
}
