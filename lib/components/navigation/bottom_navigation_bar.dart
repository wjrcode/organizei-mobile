import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organizei/components/navigation/menu.dart';

import '../box.dart';

class ButtonNavigatorBar extends StatefulWidget {
  const ButtonNavigatorBar({Key? key}) : super(key: key);

  @override
  State<ButtonNavigatorBar> createState() => _ButtonNavigatorBarState();
}

class _ButtonNavigatorBarState extends State<ButtonNavigatorBar>
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

  Icon _retornarIconeAdd() {
    if (addIcone == true) return const Icon(Icons.close);

    return const Icon(Icons.add);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            AnimatedSlide(
              offset: offset,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Menu(),
            ),
            Box(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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

                          if (addIcone)
                            _slideUp();
                          else
                            _slideDown();
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
            ),
          ],
        ),
      ],
    );
  }
}
