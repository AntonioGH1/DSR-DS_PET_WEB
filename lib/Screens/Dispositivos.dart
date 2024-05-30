import 'package:flutter/material.dart';
import '../Widgets/dispositivos_grid.dart'; // Importa el widget DispositivosGrid

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
        child: DispositivosGrid(),
      ),
    );
  }
}
