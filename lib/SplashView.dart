import 'package:flutter/material.dart';
import 'package:organizei/Controller/SplashController.dart';
import 'package:organizei/home_page.dart';
import 'package:organizei/services/notificacao/notification_api.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var controller = SplashController();

  @override
  void initState() {
    //super.initState();
    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen(onClickedNotification);
  void onClickedNotification(String? payload) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage()));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.telaInicial(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return snapshot.data;
        }
      },
    );
  }
}
