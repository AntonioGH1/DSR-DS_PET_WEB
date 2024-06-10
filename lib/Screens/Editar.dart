import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Editar extends StatelessWidget {
  final String idDispositivo;
  final String status;
  final String activationTime;
  final void Function(Map<String, dynamic>) onSave;

  Editar({
    required this.idDispositivo,
    required this.status,
    required this.activationTime,
    required this.onSave,
  });

  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _activationTimeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _statusController.text = status;
    _activationTimeController.text = activationTime;

    return Dialog(
      backgroundColor: Color.fromARGB(255, 236, 236, 215), // Fondo beige
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Borde redondeado
      ),
      child: Container(
        width: 280, // Ancho más pequeño
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de ID de Dispositivo (no editable)
              Text(
                'ID: $idDispositivo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Status (editable)
              TextFormField(
                controller: _statusController,
                decoration: InputDecoration(
                  labelText: 'Status',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Activation Time (editable)
              TextFormField(
                controller: _activationTimeController,
                decoration: InputDecoration(
                  labelText: 'Activation Time',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 8), // Espacio entre los campos y los botones
              // Botones de Guardar y Cancelar
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Lógica para guardar los datos
                      final data = {
                        'status': _statusController.text,
                        'activationTime': _activationTimeController.text,
                      };
                      onSave(data);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromRGBO(202, 224, 200, 1), // Color de fondo
                    ),
                    child: Text('Guardar'),
                  ),
                  SizedBox(width: 8), // Espacio entre los botones
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(); // Cierra la pantalla de edición
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
