import 'package:flutter/material.dart';
import 'screen/registerMarks.dart';
import 'screen/viewmarks.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/register_marks',
    routes: {
      '/register_marks': (context) => RegisterMarksScreen(),
      '/view_marks': (context) => ViewScreen(),
    },
  ));
}
