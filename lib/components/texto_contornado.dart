import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextoContornado extends StatelessWidget {
  const TextoContornado({Key? key, this.cor, this.texto, this.tamanho})
      : super(key: key);

  final String? texto;
  final double? tamanho;
  final Color? cor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          texto!,
          style: TextStyle(
            height: 1,
            letterSpacing: tamanho! / 11,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = tamanho! / 8
              ..color = Colors.black,
            fontSize: tamanho,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          texto!,
          style: TextStyle(
            height: 1,
            letterSpacing: tamanho! / 11,
            fontSize: tamanho,
            fontWeight: FontWeight.bold,
            color: cor,
          ),
        ),
      ],
    );
  }
}
