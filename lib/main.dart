import 'package:flutter/material.dart';
import 'package:udemy_appstore_tutorial/screens/bottom_bar.dart';

import 'screens/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.red,
          selectionColor: Colors.blue[200],
          selectionHandleColor: Colors.blue,
        ),
      ),
      home: BottomBarScreen(),
    );
  }
}
