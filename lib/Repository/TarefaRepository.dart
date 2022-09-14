import 'dart:convert';

import 'package:organizei/Model/API/APIModel.dart';

import 'package:http/http.dart' as http;
import 'package:organizei/Model/API/ResponseAPIModel.dart';
import 'package:organizei/Model/Tarefa/TarefaModel.dart';

class TarefaRepository {
  Future<ResponseAPIModel> addTarefa(TarefaModel model) async {
    var json = {
      "nome": model.nome,
      "dataehora": model.dataehora,
      "observacao": model.observacao,
      "prioridade": model.prioridade,
      "cor": model.prioridade,
    };

    final response = await http.post(Uri.parse(ApiModel.ApiUrl + '/tarefas'),
        headers: ApiModel.headers, body: jsonEncode(json));

    return ResponseAPIModel.fromJson(jsonDecode(response.body));
  }
}
