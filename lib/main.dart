import 'package:flutter/material.dart';
import 'package:pokemon_sem10/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pokedes",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
