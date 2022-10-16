import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Projeto/ProjetoModel.dart';

class ProjetoRepository {
  Future<ResponseAPIModel> addProjeto(ProjetoModel model) async {
    var json = {
      "nome": model.nome,
      "dataInicial": model.dataInicial,
      "observacao": model.observacao,
      "dataFinal": model.dataFinal,
      "cor": model.cor,
    };

    print('olha to here');

    final response = await http.post(Uri.parse(ApiModel.ApiUrl + '/projetos'),
        headers: ApiModel.headers, body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateProjeto(ProjetoModel model) async {
    var json = {
      "nome": model.nome,
      "dataInicial": model.dataInicial,
      "observacao": model.observacao,
      "dataFinal": model.dataFinal,
      "cor": model.cor,
    };

    final response = await http.put(
        Uri.parse(ApiModel.ApiUrl + '/projetos/' + model.id.toString()),
        headers: ApiModel.headers,
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> concluirProjeto(
      ProjetoModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(
            ApiModel.ApiUrl + '/projetos/' + model.id.toString() + '/concluir'),
        headers: ApiModel.headers,
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirProjeto(ProjetoModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel.ApiUrl + '/projetos/' + model.id.toString()),
        headers: ApiModel.headers);

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<Map<String, dynamic>> getProjetos() async {
    Uri url = Uri.parse(ApiModel.ApiUrl + '/projetos');

    var _url = Uri.parse(url.toString());
    final response = await http.get(_url, headers: ApiModel.headers);

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }

  Future<Map<String, dynamic>> get() async {
    Uri url = Uri.parse(ApiModel.ApiUrl + '/projetos');

    var _url = Uri.parse(url.toString());
    final response = await http.get(_url, headers: ApiModel.headers);

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }
}
