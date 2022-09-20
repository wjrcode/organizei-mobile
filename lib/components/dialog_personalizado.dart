import 'package:flutter/material.dart';
import 'package:organizei/components/box.dart';
import 'package:organizei/components/texto_contornado.dart';

class DialogPersonalizado extends StatefulWidget {
  const DialogPersonalizado({
    Key? key,
    required this.child,
    required this.nome,
  }) : super(key: key);

  final List<Widget> child;
  final String nome;

  @override
  State<DialogPersonalizado> createState() => _DialogPersonalizadoState();
}

class _DialogPersonalizadoState extends State<DialogPersonalizado>
    with SingleTickerProviderStateMixin {
  bool addIcone = false;

  Offset offset = const Offset(0, 2);

  void _slideUp() {
    setState(() {
      offset = const Offset(0, 0);
    });
  }

  void _slideDown() {
    setState(() {
      offset = const Offset(0, 2);
    });
  }

  @override
  void initState() {
    //offset = const Offset(0, 2);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _slideUp());
    //offset = const Offset(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    //_slideUp();

    return AnimatedSlide(
      offset: offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Box(
        radius: 47,
        minHeight: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: const Icon(Icons.close),
                        onTap: () {
                          _slideDown();
                          Future.delayed(Duration(milliseconds: 500))
                              .then((value) => Navigator.pop(context));
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextoContornado(
                      texto: widget.nome,
                      tamanho: 32,
                      cor: const Color(0xFF6385C3),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
