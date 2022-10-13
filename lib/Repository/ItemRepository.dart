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
            ApiModel.ApiUrl + '/item/' + model.id.toString() + '/concluir'),
        headers: ApiModel.headers,
        body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }
}
