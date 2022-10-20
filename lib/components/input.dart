import 'package:flutter/material.dart';

class input extends StatelessWidget {
  const input(
      {Key? key,
      this.onSaved,
      this.textController,
      this.label,
      this.funcao,
      this.senha = false,
      this.excluir = false,
      this.readOnly = false,
      this.placeholder = ''})
      : super(key: key);

  final dynamic onSaved;
  final TextEditingController? textController;
  final String? label;
  final bool? senha;
  final bool? readOnly;
  final String? placeholder;
  final bool? excluir;
  final Function? funcao;

  @override
  Widget build(BuildContext context) {
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
              //key: key ?? Key("keyTesteButton"),
              obscureText: senha!,
              readOnly: readOnly!,
              onSaved: onSaved,
              controller: textController,
              decoration: InputDecoration(
                suffixIcon: excluir!
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
}
