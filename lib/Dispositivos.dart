import 'package:flutter/material.dart';
import 'Configurar.dart'; // Importa el archivo Configurar.dart para la pantalla emergente

class Dispositivos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icono de flecha hacia atrás
          onPressed: () {
            Navigator.pop(context); // Volver atrás
          },
        ),
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alinear al extremo derecho
          children: [
            Text(
              '<<Dispositivos Pet+>>',
              style: TextStyle(fontSize: 20), // Tamaño de texto aumentado
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(90, 15, 90, 0), // Ajusta el padding
        child: GridView.count(
          crossAxisCount: 3, // Tres columnas
          mainAxisSpacing: 20, // Espacio vertical entre las tarjetas reducido
          crossAxisSpacing:
              70, // Espacio horizontal entre las tarjetas reducido
          children: List.generate(6, (index) {
            return TarjetaDispositivo(
              idDispositivo: 'ID Dispositivo ${index + 1}',
              status: 'Activo', // Por defecto, todos están activos
              idDueno: 'ID Dueño ${index + 1}',
            );
          }),
        ),
      ),
    );
  }
}

class TarjetaDispositivo extends StatelessWidget {
  final String idDispositivo;
  final String status;
  final String idDueno;

  TarjetaDispositivo({
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
