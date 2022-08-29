class ResponseAPIModel {
  bool? valido;
  String? msg;
  int? statusCode;

  ResponseAPIModel({this.valido, this.msg, this.statusCode});

  ResponseAPIModel.fromJson(Map<String, dynamic> json) {
    valido = json['valido'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valido'] = this.valido;
    data['msg'] = this.msg;
    data['statusCode'] = this.statusCode;

    return data;
  }
}
