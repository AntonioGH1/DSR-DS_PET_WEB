import 'package:flutter/material.dart';
import 'Editar.dart'; // Importa la pantalla emergente Editar.dart
import '../Widgets/Apagar.dart'; // Importa el diálogo ApagarDialog

class Configurar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color.fromARGB(255, 236, 236, 215), // Fondo beige
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Borde redondeado
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height:
                    8), // Espacio entre el título y los datos del dispositivo
            // Datos del dispositivo (texto de prueba)
            Text(
              'ID: 123456\nStatus: Activo\nDueño: Juan Pérez',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
                height:
                    16), // Espacio entre los datos del dispositivo y los botones
            // Botón de Regresar
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la pantalla emergente
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(202, 224, 200, 1), // Color de fondo
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 12), // Ajusta el tamaño del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borde redondeado
                ),
              ),
              child: Text(
                'Regresar',
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ),
            SizedBox(height: 8), // Espacio entre los botones
            // Botón de Editar
            ElevatedButton(
              onPressed: () {
                // Muestra la pantalla emergente de edición
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Editar(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(202, 224, 200, 1), // Color de fondo
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 12), // Ajusta el tamaño del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borde redondeado
                ),
              ),
              child: Text(
                'Editar',
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ),
            SizedBox(height: 8), // Espacio entre los botones
            // Botón de Apagar
            ElevatedButton(
              onPressed: () {
                // Muestra el diálogo de apagado
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Apagar(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(216, 51, 51, 1), // Color de fondo
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 12), // Ajusta el tamaño del botón
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borde redondeado
                ),
              ),
              child: Text(
                'Apagar',
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ),
          ],
        ),
      ),
    );
  }
}
