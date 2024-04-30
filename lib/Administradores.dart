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
        title: Text(
          'Administradores',
          textAlign: TextAlign.right, // Alinea el texto a la derecha
        ),
        actions: [
          SizedBox(width: 16), // Espacio entre el icono y el borde derecho
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3, // Tres columnas
        children: List.generate(6, (index) {
          return TarjetaPerfil(
            nombreUsuario: 'Usuario ${index + 1}',
          );
        }),
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
        borderRadius: BorderRadius.circular(8), // Reducimos el radio de borde
      ),
      color: Color.fromARGB(255, 236, 236, 215), // Fondo beige
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ícono de perfil
          CircleAvatar(
            radius: 24, // Reducimos el tamaño del círculo de perfil
            backgroundImage: AssetImage(
                '../assets/usuario.png'), // Reemplaza con la imagen de perfil
          ),
          SizedBox(height: 8), // Espacio entre el círculo de perfil y el texto
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
