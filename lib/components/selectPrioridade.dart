import 'package:flutter/material.dart';

import '../Controller/TarefaController.dart';

const List<String> list = <String>['baixa', 'média', 'alta'];

class SelectPrioridade extends StatefulWidget {
  final dynamic prioridade;
  final String prioridadeAtual;
  const SelectPrioridade({Key? key, this.prioridade, this.prioridadeAtual = ''})
      : super(key: key);

  @override
  State<SelectPrioridade> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<SelectPrioridade> {
  String dropdownValue = list.first;

  @override
  void initState() {
    super.initState();
    dropdownValue =
        widget.prioridadeAtual != '' ? widget.prioridadeAtual : list.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'prioridade',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(20),
          icon: const Icon(Icons.expand_more),
          decoration: InputDecoration(
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
          ),
          onSaved: widget.prioridade,
          value: dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.grey),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
