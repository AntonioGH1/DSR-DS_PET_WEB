import 'package:flutter/material.dart';
import 'dispositivo_card.dart'; // Importa el widget DispositivoCard

class DispositivosGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // Tres columnas
      mainAxisSpacing: 20, // Espacio vertical entre las tarjetas reducido
      crossAxisSpacing: 70, // Espacio horizontal entre las tarjetas reducido
      children: List.generate(6, (index) {
        return DispositivoCard(
          idDispositivo: 'ID Dispositivo ${index + 1}',
          status: 'Activo', // Por defecto, todos están activos
          idDueno: 'ID Dueño ${index + 1}',
        );
      }),
    );
  }
}
