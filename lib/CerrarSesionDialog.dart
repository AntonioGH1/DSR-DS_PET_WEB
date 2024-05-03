import 'package:flutter/material.dart';

class CerrarSesionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFFECECD7), // Fondo beige
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Bordes redondeados
      ),
      content: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(202, 224, 200, 1), // Color de la burbuja
          borderRadius: BorderRadius.circular(15), // Bordes redondeados
        ),
        padding: EdgeInsets.all(12),
        child: Text(
          '¿Desea cerrar sesión?',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Implementa la lógica para cerrar sesión aquí
                Navigator.pop(context); // Regresa a la página anterior (Login)
              },
              child: Text(
                'SÍ',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(202, 224, 200, 1), // Fondo verde
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // Fondo rojo
              ),
            ),
          ],
        ),
      ],
    );
  }
}
