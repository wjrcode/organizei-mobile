import 'package:flutter/material.dart';
import 'package:organizei/components/texto_contornado.dart';

class Botao extends StatelessWidget {
  const Botao({
    Key? key,
    this.texto,
    this.cor,
    this.clicar,
  }) : super(key: key);

  final String? texto;
  final Color? cor;
  final VoidCallback? clicar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 60,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              // side: BorderSide(color: Colors.red)
            )),
            side: MaterialStateProperty.all(
                const BorderSide(width: 3, color: Colors.black)),
            backgroundColor: MaterialStateProperty.all(cor!),
          ),
          child: TextoContornado(
            texto: texto!,
            tamanho: 24,
            cor: const Color(0xFFFFFFFF),
          ),
          onPressed: () => clicar!()),
    );
  }
}
