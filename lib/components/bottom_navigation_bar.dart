import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonNavigatorBar extends StatefulWidget {
  const ButtonNavigatorBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavigatorBar> createState() => _ButtonNavigatorBarState();
}

class _ButtonNavigatorBarState extends State<ButtonNavigatorBar> {
  bool addIcone = false;

  Icon _retornarIconeAdd() {
    if (addIcone == true) return const Icon(Icons.close);

    return const Icon(Icons.add);
  }

  Future<void> _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            //margin: EdgeInsets.all(32),
            height: 100.0, // Change as per your requirement
            width: 100.0,
            decoration: BoxDecoration(
              color: Color(0xFFF7BC36),
              borderRadius: BorderRadius.all(Radius.circular(24)),
              border: Border.all(
                width: 3,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(children: <Widget>[Center(child: Text('mdss aaa'))]),
            // child: SimpleDialog(
            //   //title: const Text('Select assignment'),
            //   children: <Widget>[
            //     SimpleDialogOption(
            //       onPressed: () {
            //         debugPrint('1');
            //       },
            //       child: const Text('criar lista'),
            //     ),
            //     SimpleDialogOption(
            //       onPressed: () {
            //         {
            //           debugPrint('2');
            //         }
            //       },
            //       child: const Text('criar tarefa'),
            //     ),
            //     SimpleDialogOption(
            //       onPressed: () {
            //         {
            //           debugPrint('2');
            //         }
            //       },
            //       child: const Text('criar hábito'),
            //     ),
            //     SimpleDialogOption(
            //       onPressed: () {
            //         {
            //           debugPrint('2');
            //         }
            //       },
            //       child: const Text('criar projeto'),
            //     ),
            //     SimpleDialogOption(
            //       onPressed: () {
            //         {
            //           debugPrint('2');
            //         }
            //       },
            //       child: const Text('criar lembrete'),
            //     ),
            //   ],
            // ),
          );
        })) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(24.0),
          ),
          border: Border.all(
            width: 3,
            color: Colors.black,
            style: BorderStyle.solid,
          ),
          color: Color(0xFFE9E9E9),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bar_chart_outlined),
              onPressed: () {},
            ),
            DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            Container(
              child: PopupMenuButton(
                child: IconButton(
                  icon: _retornarIconeAdd(), onPressed: () {},
                  //   onPressed: () {
                  //     setState(() {
                  //       addIcone = !addIcone;
                  //     });

                  //     //_askedToLead();
                  //   },
                ),
                itemBuilder: (context) {
                  return <PopupMenuItem>[
                    new PopupMenuItem(child: Text('Delete'))
                  ];
                },
              ),
              // child: IconButton(
              //   icon: _retornarIconeAdd(),
              //   onPressed: () {
              //     setState(() {
              //       addIcone = !addIcone;
              //     });

              //     //_askedToLead();
              //   },
              // ),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF7BC36),
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.list_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.folder_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
