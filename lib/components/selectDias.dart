import 'package:flutter/material.dart';
import 'package:organizei/Controller/TarefaController.dart';

class SelectDia extends StatefulWidget {
  final dynamic dia;
  final List<dynamic>? diaAtual;
  const SelectDia(
      {Key? key,
      required this.dia,
      this.diaAtual = const ['0', '0', '0', '0', '0', '0', '0']})
      : super(key: key);

  @override
  State<SelectDia> createState() => _SelectDiaState();
}

class _SelectDiaState extends State<SelectDia> {
  List<String> dias = ['d', 's', 't', 'q', 'q', 's', 's'];
  List<dynamic>? teste = ['0', '0', '0', '0', '0', '0', '0'];

  late String diaSelected = '';

  @override
  void initState() {
    super.initState();
    teste = widget.diaAtual!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'repetir',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              height: 45,
              child: ListView(
                itemExtent: 50.0,
                scrollDirection: Axis.horizontal,
                children: dias.asMap().entries.map((dia) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        teste![dia.key] = teste![dia.key] == '1' ? '0' : '1';
                      });
                      widget.dia(teste);
                      //widget.dia(teste));
                    },
                    child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: teste![dia.key] == '1'
                                ? const Color(0xFF74C198)
                                : const Color(0xFFE9E9E9),
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            dia.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }
}
