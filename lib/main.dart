import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:organizei/SplashView.dart';
import 'package:organizei/components/card_item.dart';
import 'package:intl/intl.dart';
import 'package:organizei/start_page.dart';

//import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizei',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
      //HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
