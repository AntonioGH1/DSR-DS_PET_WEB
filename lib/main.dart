import 'package:flutter/material.dart';
import 'iniciosesion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mockup App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InicioSesion(),
    );
  }
}
