import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Habito/HabitoModel.dart';

class HabitoRepository {
  Future<ResponseAPIModel> addHabito(HabitoModel model) async {
    var json = {
      "nome": model.nome,
      "hora": model.data,
      "dias": model.dias,
      "cor": model.cor,
    };

    final response = await http.post(Uri.parse(ApiModel.ApiUrl + '/habitos'),
        headers: ApiModel.headers, body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> updateHabito(HabitoModel model) async {
    var json = {
      "nome": model.nome,
      "hora": model.data,
      "dias": model.dias,
      "cor": model.cor,
    };

    final response = await http.put(
        Uri.parse(ApiModel.ApiUrl + '/habitos/' + model.id.toString()),
        headers: ApiModel.headers,
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> concluirHabito(
      HabitoModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(
            ApiModel.ApiUrl + '/habitos/' + model.id.toString() + '/concluir'),
        headers: ApiModel.headers,
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirHabito(HabitoModel model) async {
    final response = await http.delete(
        Uri.parse(ApiModel.ApiUrl + '/habitos/' + model.id.toString()),
        headers: ApiModel.headers);

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<List<HabitoModel>> getHabitos() async {
    Uri _uriSearchProduto = Uri.parse(ApiModel.ApiUrl + '/habitos');

    var _url = Uri.parse(_uriSearchProduto.toString());
    final response = await http.get(_url, headers: ApiModel.headers);

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    List<HabitoModel> listaProdutos = (jsonMap['habitos'] as List)
        .map((item) => HabitoModel.fromJson(item))
        .toList();

    return listaProdutos;
  }
}
