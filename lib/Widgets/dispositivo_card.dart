import 'package:flutter/material.dart';
import '../Screens/Configurar.dart'; // Importa el archivo Configurar.dart para la pantalla emergente

class DispositivoCard extends StatelessWidget {
  final String? idDispositivo;
  final String? status;
  final String? activationTime;

  DispositivoCard({
    required this.idDispositivo,
    required this.status,
    required this.activationTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromARGB(255, 236, 236, 215),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
                'ID: ${idDispositivo ?? "N/A"}'), // Verifica si idDispositivo es null
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Status: ${status ?? "N/A"}'), // Verifica si status es null
                Text(
                    'Activation Time: ${activationTime ?? "N/A"}'), // Verifica si activationTime es null
              ],
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Configurar(
                      idDispositivo: idDispositivo ?? "",
                      status: status ?? "N/A",
                      activationTime: activationTime ?? "N/A",
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(202, 224, 200, 1),
              ),
              child: Text(
                'Editar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
