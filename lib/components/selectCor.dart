import 'package:flutter/material.dart';
import 'package:organizei/Controller/TarefaController.dart';

class SelectCor extends StatefulWidget {
  final TarefaController tarefaController;
  const SelectCor({Key? key, required this.tarefaController}) : super(key: key);

  @override
  State<SelectCor> createState() => _SelectCorState();
}

class _SelectCorState extends State<SelectCor> {
  List<int> cores = [
    0xFF6385C3,
    0xFFEF7E69,
    0xFF6BC8E4,
    0xFFF7BC36,
    0xFF74C198
  ];

  late int corSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'cor',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Expanded(
              child: SizedBox(
                height: 50,
                child: ListView(
                  itemExtent: 70.0,
                  scrollDirection: Axis.horizontal,
                  children: cores.map((strone) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          corSelected = strone;
                        });
                        widget.tarefaController
                            .tarefaCor(corSelected.toString());
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(strone),
                            border: Border.all(
                              width: corSelected == strone ? 5 : 3,
                              color: corSelected == strone
                                  ? Colors.white
                                  : Colors.black,
                              style: BorderStyle.solid,
                            )),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )),
      ],
    );
  }
}
