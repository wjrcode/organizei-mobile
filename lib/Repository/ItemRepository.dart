import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Item/ItemModel.dart';

class ItemRepository {
  Future<ResponseAPIModel> concluirItem(ItemModel model, bool concluido) async {
    var json = {
      "concluido": concluido,
    };

    final response = await http.put(
        Uri.parse(
            ApiModel().ApiUrl + '/item/' + model.id.toString() + '/concluir'),
        headers: await ApiModel().getHeaders(),
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseAPIModel> excluirItem(ItemModel model) async {
    final response = await http.delete(
      Uri.parse(ApiModel().ApiUrl + '/item/' + model.id.toString()),
      headers: await ApiModel().getHeaders(),
    );

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }
}
