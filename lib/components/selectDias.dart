import 'package:flutter/material.dart';
import 'package:organizei/Controller/TarefaController.dart';

class SelectDia extends StatefulWidget {
  final dynamic dia;
  final String diaAtual;
  const SelectDia({Key? key, required this.dia, this.diaAtual = ''})
      : super(key: key);

  @override
  State<SelectDia> createState() => _SelectDiaState();
}

class _SelectDiaState extends State<SelectDia> {
  List<String> dias = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

  late String diaSelected = '';

  @override
  void initState() {
    super.initState();
    diaSelected = widget.diaAtual;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'dia',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              height: 50,
              child: ListView(
                itemExtent: 50.0,
                scrollDirection: Axis.horizontal,
                children: dias.map((dia) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        diaSelected = dia;
                      });
                      widget.dia(diaSelected.toString());
                    },
                    child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE9E9E9),
                            border: Border.all(
                              width: 3,
                              color: Colors.black,
                              style: BorderStyle.solid,
                            )),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            dia,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                        //   ),Text(
                        //   dia,
                        //   textAlign: TextAlign.center,
                        // ),
                        ),
                  );
                }).toList(),
              ),
            )),
      ],
    );
  }
}
