import 'package:flutter/material.dart';

Widget input(
    {dynamic onSaved,
    TextEditingController? textController,
    String? label,
    bool senha = false,
    bool readOnly = false,
    String? placeholder = '',
    bool excluir = false,
    Function? funcao}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Material(
          color: Colors.white.withOpacity(0),
          child: TextFormField(
            obscureText: senha,
            readOnly: readOnly,
            onSaved: onSaved,
            controller: textController,
            decoration: InputDecoration(
              suffixIcon: excluir
                  ? GestureDetector(
                      onTap: () {
                        funcao!();
                      },
                      child: const Icon(Icons.close))
                  : null,
              hintText: placeholder,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),

              //labelText: 'Password',
            ),
          ),
        )
      ]);
}
