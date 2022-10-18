class ResponseAPIModel {
  bool? valido;
  String? msg;
  int? id;
  int? statusCode;

  ResponseAPIModel({this.id, this.valido, this.msg, this.statusCode});

  ResponseAPIModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'] != null ? int.parse(json['id']) : null;
    }
    valido = json['valido'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valido'] = valido;
    data['msg'] = msg;
    data['statusCode'] = statusCode;
    data['id'] = id;

    return data;
  }
}
