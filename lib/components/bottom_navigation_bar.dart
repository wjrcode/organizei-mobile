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
          );
        })) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                  border: Border.all(
                    width: 3,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                  color: Color(0xFFF7BC36),
                ),
                //width: 100,
                child: Visibility(
                  visible: addIcone,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'criar lista',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'criar tarefa',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'criar hábito',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'criar projeto',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'criar lembrete',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
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
                    Container(
                      child: IconButton(
                        icon: _retornarIconeAdd(),
                        onPressed: () {
                          setState(() {
                            addIcone = !addIcone;
                          });
                        },
                      ),
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
            ],
          ),
        ],
      ),
    );
  }
}
