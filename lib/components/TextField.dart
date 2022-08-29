import 'package:flutter/material.dart';

Widget textFieldEmpresaValidator(dynamic onSaved,
    TextEditingController textController, String label, String validadorText) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
    ),
    onSaved: onSaved,
    controller: textController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validadorText;
      }
      return null;
    },
  );
}

Widget textFieldEmpresaReadonly(
    TextEditingController textController, String label) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
    ),
    controller: textController,
    readOnly: true,
  );
}

Widget textFieldEmpresaDisabled(
    TextEditingController textController, String label) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
    ),
    controller: textController,
    enabled: false,
  );
}

Widget textFieldValidator(
  dynamic onSaved,
  TextEditingController textController,
  String label,
  String validadorText,
  bool obscure,
  Icon icon,
) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
      icon: icon,
    ),
    onSaved: onSaved,
    obscureText: obscure,
    controller: textController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validadorText;
      }
      return null;
    },
  );
}
