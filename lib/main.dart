import 'package:calculator/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
  //runApp(const MyApp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


