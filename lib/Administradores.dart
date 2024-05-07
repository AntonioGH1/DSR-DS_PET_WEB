import 'package:flutter/material.dart';

class Administradores extends StatelessWidget {
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
              '<<Admins Pet+>>',
              style: TextStyle(fontSize: 20), // Tamaño de texto aumentado
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(70, 15, 70, 0), // Ajusta el padding
        child: GridView.count(
          crossAxisCount: 3, // Tres columnas
          mainAxisSpacing: 20, // Espacio vertical entre las tarjetas reducido
          crossAxisSpacing:
              70, // Espacio horizontal entre las tarjetas reducido
          children: List.generate(6, (index) {
            return TarjetaPerfil(
              nombreUsuario: 'Usuario ${index + 1}',
            );
          }),
        ),
      ),
    );
  }
}

class TarjetaPerfil extends StatelessWidget {
  final String nombreUsuario;

  TarjetaPerfil({required this.nombreUsuario});

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
          // Ícono de perfil
          CircleAvatar(
            radius: 40, // Reducimos el tamaño del círculo de perfil
            backgroundImage: AssetImage(
                '../assets/usuario.png'), // Reemplaza con la imagen de perfil
          ),
          SizedBox(height: 4), // Espacio entre el círculo de perfil y el texto
          // Estado del usuario
          Text(
            'Activo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // Nombre de usuario
          Text(
            nombreUsuario,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
