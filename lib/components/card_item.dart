import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizei/components/texto_contornado.dart';

class cardItem extends StatelessWidget {
  final Color? cor;
  final String? horario;
  final String? nome;

  const cardItem({Key? key, this.cor, this.horario, this.nome})
      : super(key: key);

  String formatarNome() {
    if (this.nome!.length > 17) {
      String nomeAbreviado = this.nome!.substring(0, 17);
      return nomeAbreviado + '...';
    } else
      return this.nome!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: BorderRadius.all(Radius.circular(24)),
            border: Border.all(
              width: 3,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(21)),
            child: GestureDetector(
              onTap: () {
                debugPrint(nome);
              },
              child: Row(
                children: [
                  Container(
                    width: 90,
                    //height: 90,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: cor,
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: TextoContornado(
                        texto: formatarNome(),
                        tamanho: 24,
                        cor: cor,
                      ),
                      subtitle: Text(
                        horario!,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     GestureDetector(
                  //       onTap: () {},
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Icon(Icons.close,
                  //             color: Colors.green[900], size: 24),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          )),
    );
  }
}
