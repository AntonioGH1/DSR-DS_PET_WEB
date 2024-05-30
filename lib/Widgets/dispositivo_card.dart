import 'package:flutter/material.dart';
import '../Screens/Configurar.dart'; // Importa el archivo Configurar.dart para la pantalla emergente

class DispositivoCard extends StatelessWidget {
  final String idDispositivo;
  final String status;
  final String idDueno;

  DispositivoCard({
    required this.idDispositivo,
    required this.status,
    required this.idDueno,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4), // Reducimos el margen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Reducimos el radio de borde
      ),
      color: Color.fromARGB(255, 236, 236, 215), // Fondo beige
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Información del dispositivo
          ListTile(
            title: Text('ID: $idDispositivo'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Status: $status'),
                Text('Dueño: $idDueno'),
              ],
            ),
          ),
          // Botón de editar
          SizedBox(height: 8), // Añade espacio entre el texto y el botón
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                // Mostrar pantalla emergente para configurar el dispositivo
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Configurar(); // Llama a la pantalla emergente
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromRGBO(202, 224, 200, 1), // Color de fondo
              ),
              child: Text(
                'Editar',
                style: TextStyle(color: Colors.black), // Texto negro
              ),
            ),
          ),
        ],
      ),
    );
  }
}
