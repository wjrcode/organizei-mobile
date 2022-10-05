import 'package:flutter/material.dart';
import 'package:organizei/components/dialog_personalizado.dart';
import 'package:organizei/components/dialogs/tarefas/tarefaCadastroDialog.dart';
import 'package:organizei/components/dialogs/habitos/habitoCadastroDialog.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key, this.fecharMenu, this.fecharDialog = null})
      : super(key: key);

  final Function? fecharMenu;
  final Function? fecharDialog;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(30.0),
            ),
            border: Border.all(
              width: 3,
              color: Colors.black,
              style: BorderStyle.solid,
            ),
            color: Color(0xFFF7BC36),
          ),
          //width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.fecharMenu!();
                  showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.white.withOpacity(0),
                      context: context,
                      builder: (context) {
                        return Container(
                          margin: EdgeInsets.only(top: 24),
                          child: DialogPersonalizado(
                            nome: 'Lista',
                            //minHeight: MediaQuery.of(context).size.height * 0.8,
                            child: <Widget>[
                              Text(
                                'nome',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Material(
                                color: Colors.white.withOpacity(0),
                                child: TextField(
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

                                    //labelText: 'Password',
                                  ),
                                ),
                              ),
                              Text(
                                'item',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Material(
                                color: Colors.white.withOpacity(0),
                                child: TextField(
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

                                    //labelText: 'Password',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                height: 60,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        // side: BorderSide(color: Colors.red)
                                      )),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                              width: 3, color: Colors.black)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFF6385C3)),
                                    ),
                                    child: Text(
                                      'SALVAR',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: AbsorbPointer(
                  //width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'criar lista',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  criarTarefa(context, fecharDialog: widget.fecharDialog);
                  widget.fecharMenu!();
                },
                child: AbsorbPointer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'criar tarefa',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 3,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: () {
                  criarHabito(context, fecharDialog: widget.fecharDialog);
                  widget.fecharMenu!();
                },
                child: AbsorbPointer(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'criar hábito',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ),
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
      ],
    );
  }
}
