import 'package:flutter/material.dart';
import 'package:organizei/components/navigation/menu.dart';
import 'package:organizei/home_page.dart';
import 'package:organizei/listas_page.dart';

import '../box.dart';

class ButtonNavigatorBar extends StatefulWidget {
  const ButtonNavigatorBar({Key? key, this.fecharDialog = null})
      : super(key: key);

  final Function? fecharDialog;

  @override
  State<ButtonNavigatorBar> createState() => _ButtonNavigatorBarState();
}

class _ButtonNavigatorBarState extends State<ButtonNavigatorBar>
    with SingleTickerProviderStateMixin {
  bool addIcone = false;
  String iconSelected = 'home';

  Offset offset = const Offset(0, 2);

  void _slideUp() {
    setState(() {
      offset = const Offset(0, 0);
    });
  }

  void _slideDown() {
    setState(() {
      addIcone = false;
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
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              child: Container(
                  child: Menu(
                      fecharMenu: _slideDown,
                      fecharDialog: widget.fecharDialog)),
            ),
            Box(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.home_outlined,
                        color: iconSelected == 'home'
                            ? const Color(0xFFF7BC36)
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          iconSelected = 'home';
                        });
                        Navigator.of(context).push<void>(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => HomePage(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.bar_chart_outlined,
                        color: iconSelected == 'dashboard'
                            ? const Color(0xFFF7BC36)
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          iconSelected = 'dashboard';
                        });
                      },
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
                      icon: Icon(
                        Icons.list_outlined,
                        color: iconSelected == 'listas'
                            ? const Color(0xFFF7BC36)
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          iconSelected = 'listas';
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListasPage()),
                        );
                        // Navigator.of(context).push<void>(
                        //   MaterialPageRoute<void>(
                        //     builder: (BuildContext context) => ListasPage(),
                        //   ),
                        // );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.folder_outlined,
                        color: iconSelected == 'projetos'
                            ? const Color(0xFFF7BC36)
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          iconSelected = 'projetos';
                        });
                      },
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
