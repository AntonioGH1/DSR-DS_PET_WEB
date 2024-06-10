import 'package:flutter/material.dart';
import '../Screens/Administradores.dart'; // Importa el archivo Administradores.dart
import '../Screens/Dispositivos.dart'; // Importa el archivo Dispositivos.dart
import 'PerfilUsuario.dart'; // Importa el archivo PerfilUsuario.dart
import 'CerrarSesionDialog.dart'; // Importa el archivo de la pantalla emergente

class BotonesNavegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BotonNavegacion(
          text: 'IA',
          onPressed: () {},
        ),
        BotonNavegacion(
          text: 'Dispositivos',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dispositivos()),
            );
          },
        ),
        BotonNavegacion(
          text: 'Administradores',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Administradores()),
            );
          },
        ),
      ],
    );
  }
}

class BotonNavegacion extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BotonNavegacion({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 236, 236, 215),
        textStyle: TextStyle(fontSize: 16),
        padding: EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 12,
        ),
      ),
    );
  }
}
