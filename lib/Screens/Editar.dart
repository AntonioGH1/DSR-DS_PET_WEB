import 'package:flutter/material.dart';

class Editar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'ID: ABC123',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Dueño (editable)
              TextFormField(
                initialValue: 'Alberto',
                decoration: InputDecoration(
                  labelText: 'Dueño',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Gato (editable)
              TextFormField(
                initialValue: 'Firu',
                decoration: InputDecoration(
                  labelText: 'Gato',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Raza (editable)
              TextFormField(
                initialValue: 'Alemán',
                decoration: InputDecoration(
                  labelText: 'Raza',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Edad (editable)
              TextFormField(
                initialValue: '2 años',
                decoration: InputDecoration(
                  labelText: 'Edad',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Horario (editable)
              TextFormField(
                initialValue: 'Lunes 9 am',
                decoration: InputDecoration(
                  labelText: 'Horario',
                  isDense: true, // Reduce el espacio vertical
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12), // Reduce el espacio horizontal
                ),
              ),
              SizedBox(height: 4), // Espacio entre los campos
              // Campo de Alimento (editable)
              TextFormField(
                initialValue: '400 g',
                decoration: InputDecoration(
                  labelText: 'Alimento',
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
                    onPressed: () {
                      // Lógica para guardar los datos
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
