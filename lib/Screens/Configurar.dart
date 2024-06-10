import 'package:flutter/material.dart';
import 'Editar.dart'; // Importa la pantalla emergente Editar.dart
import '../Widgets/Apagar.dart'; // Importa el diálogo ApagarDialog
import 'package:http/http.dart' as http;
import 'dart:convert';

class Configurar extends StatelessWidget {
  final String idDispositivo;
  final String status;
  final String activationTime;

  Configurar({
    required this.idDispositivo,
    required this.status,
    required this.activationTime,
  });

  Future<void> _actualizarDispositivo(
      String id, Map<String, dynamic> data) async {
    final url =
        'https://eouww9yquk.execute-api.us-east-1.amazonaws.com/machines/get_machines_user?id=4d3dfcab-c809-453a-9871-aa128193cf21';
    final response = await http.put(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Si la actualización fue exitosa
      print('Dispositivo actualizado');
    } else {
      throw Exception('Error al actualizar el dispositivo');
    }
  }

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
              'ID: $idDispositivo\nStatus: $status\nActivation Time: $activationTime',
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
                  builder: (BuildContext context) => Editar(
                    idDispositivo: idDispositivo,
                    status: status,
                    activationTime: activationTime,
                    onSave: (data) {
                      _actualizarDispositivo(idDispositivo, data);
                    },
                  ),
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
                  builder: (BuildContext context) =>
                      Apagar(idDispositivo: idDispositivo),
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
