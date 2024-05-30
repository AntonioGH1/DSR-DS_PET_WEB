import 'package:flutter/material.dart';

class Confirmacion extends StatelessWidget {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Apagado con éxito',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16), // Espacio entre el texto y el botón
            // Botón Aceptar
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Cierra el diálogo de confirmación y el diálogo de apagado
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  backgroundColor:
                      Color.fromRGBO(202, 224, 200, 1), // Fondo verde
                  padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12), // Ajusta el tamaño del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Borde redondeado
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
