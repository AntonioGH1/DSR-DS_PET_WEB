// dispositivos_grid.dart
import 'package:flutter/material.dart';
import 'dispositivo_card.dart';

class DispositivosGrid extends StatelessWidget {
  final List dispositivos; // Lista de dispositivos

  DispositivosGrid(
      {required this.dispositivos}); // Constructor que recibe la lista de dispositivos

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 70,
      ),
      itemCount: dispositivos.length,
      itemBuilder: (BuildContext context, int index) {
        return DispositivoCard(
          idDispositivo: dispositivos[index]['id'],
          status: dispositivos[index]['statusMachine'],
          activationTime: dispositivos[index]['activationTime'],
        );
      },
    );
  }
}
