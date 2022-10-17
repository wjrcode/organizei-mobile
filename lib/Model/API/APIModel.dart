import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? token = prefs.getString('UsuarioToken');
  return token ?? '';
}

class ApiModel {
  static const ApiUrl = "http://10.0.0.91:4444";
  //static const ApiUrl = "http://192.168.100.74:4444";
  //static const ApiUrl = "http://192.168.100.82:4444";

  static final Future<String> _token = getToken();

  static Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer  $_token"
  };
}
