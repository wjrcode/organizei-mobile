import 'package:flutter/material.dart';
import 'package:organizei/Controller/Base/BaseStyle.dart';

class Base {
  void showSnackBarValidate(BuildContext context, String msg, bool valido) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: valido ? Colors.green : Colors.red,
      ),
    );
  }

  void showSnackBar(BuildContext context, String msg, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: cor,
      ),
    );
  }

  void showReloadDialog(BuildContext context, String msg) {
    var alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.fromLTRB(13, 0, 0, 0),
            child: Text(msg, style: textAlert()),
          ),
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void closeAlertDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
