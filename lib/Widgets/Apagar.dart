import 'package:flutter/material.dart';
import 'Confirmacion.dart';

class Apagar extends StatelessWidget {
  final String idDispositivo;

  Apagar({required this.idDispositivo});

  // Método para actualizar el estado del dispositivo
  void actualizarEstadoDispositivo() {
    // Aquí debes colocar la lógica para actualizar el estado del dispositivo
    // Puedes llamar a un método en tu clase de gestión de estado o realizar la lógica directamente aquí
    // Por ejemplo:
    // dispositivo.estado = false;
    // Luego, actualiza la interfaz de usuario si es necesario
  }

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
          '¿Desea apagar el dispositivo?',
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
                // Mostrar la ventana emergente de confirmación
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Confirmacion();
                  },
                ).then((confirmado) {
                  // Verificar si el usuario confirmó antes de actualizar el estado
                  if (confirmado == true) {
                    actualizarEstadoDispositivo(); // Llamar al método para actualizar el estado del dispositivo
                  }
                });
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
