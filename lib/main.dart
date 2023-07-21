import 'package:flutter/material.dart';
import 'package:ur_loc/pages/home.dart';
import 'package:ur_loc/pages/loading.dart';
import 'package:ur_loc/pages/select_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => SelectLocation(),
    },
  ));
}
