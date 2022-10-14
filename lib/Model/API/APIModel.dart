class ApiModel {
  static const ApiUrl = "http://10.0.0.91:4444";
  //static const ApiUrl = "http://192.168.100.74:4444";
  // static const ApiUrl = "http://189.10.2.165:4444";
  static const String _token = "fd7bc88b7c0149adbc134d5d0a919814";
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $_token"
  };
}
