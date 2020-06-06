import 'package:flutter/material.dart';
import 'package:my_app/pages/choose_location.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: "/",
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
