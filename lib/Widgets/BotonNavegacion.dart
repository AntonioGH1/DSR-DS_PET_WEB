import 'package:flutter/material.dart';

class BotonNavegacion extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  BotonNavegacion({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Color.fromARGB(255, 236, 236, 215),
      ),
    );
  }
}
