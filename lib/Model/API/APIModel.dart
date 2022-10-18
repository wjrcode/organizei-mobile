import 'package:shared_preferences/shared_preferences.dart';

class ApiModel {
  String ApiUrl = "http://192.168.100.74:4444";

  Future<Map<String, String>> getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('UsuarioToken');

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + token!
    };
    return headers;
  }
}
