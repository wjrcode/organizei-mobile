import 'dart:convert';
import 'package:organizei/Model/API/APIModel.dart';
import 'package:http/http.dart' as http;

class DashboardRepository {
  Future<Map<String, dynamic>> getDashboard() async {
    Uri url = Uri.parse(ApiModel().ApiUrl + '/dashboard');

    var _url = Uri.parse(url.toString());
    final response =
        await http.get(_url, headers: await ApiModel().getHeaders());

    Map<String, dynamic> jsonMap = jsonDecode(response.body);

    return jsonMap;
  }
}
