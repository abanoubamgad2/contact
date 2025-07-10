import 'package:contact2/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'contacts',
      initialRoute: 'mianscreen',
      routes: {
        'mianscreen': (context) => MainScreen(),

      },
    );
  }
}