import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizei/components/texto_contornado.dart';

class cardItem extends StatelessWidget {
  final Color? cor;
  final String? horario;
  final String? nome;
  final String? dash;
  final Function? abrirDialog;
  final String? prioridade;

  const cardItem(
      {Key? key,
      this.cor,
      this.horario,
      this.nome,
      this.abrirDialog,
      this.dash,
      this.prioridade})
      : super(key: key);

  String formatarNome() {
    if (nome != null && nome!.length > 17) {
      String nomeAbreviado = nome!.substring(0, 17);
      return nomeAbreviado + '...';
    } else if (nome == null) {
      return '';
    } else {
      return nome!;
    }
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
            borderRadius: const BorderRadius.all(Radius.circular(21)),
            child: GestureDetector(
              onTap: () {
                if (abrirDialog != null) abrirDialog!();
              },
              child: Row(
                children: [
                  dash == null
                      ? Container(
                          width: 90,
                          //height: 90,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: cor,
                          ),
                          child: Center(
                              child: Text(
                            prioridade ?? "",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                        )
                      : Container(
                          width: 90,
                          child: Center(
                            child: TextoContornado(
                                texto: dash, tamanho: 28, cor: cor),
                          )),
                  nome != null
                      ? Expanded(
                          child: ListTile(
                            title: TextoContornado(
                              texto: formatarNome(),
                              tamanho: 24,
                              cor: cor,
                            ),
                            subtitle: Text(
                              horario!,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListTile(
                            subtitle: Text(
                              horario!,
                              style: const TextStyle(fontSize: 16.0),
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
