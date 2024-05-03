import 'package:flutter/material.dart';
import 'Administradores.dart'; // Importa el archivo Administradores.dart
import 'CerrarSesionDialog.dart'; // Importa el archivo de la pantalla emergente

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false, // Oculta el botón de retroceso
        actions: [
          // Botón de Cerrar Sesión
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Muestra la pantalla emergente para confirmar el cierre de sesión
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CerrarSesionDialog();
                },
              );
            },
          ),
          SizedBox(width: 16), // Espacio entre el botón y el borde derecho
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto de perfil (más pequeña)
                CircleAvatar(
                  radius: 80, // Reduzco el tamaño de la imagen de perfil
                  backgroundImage: AssetImage(
                      '../assets/usuario.png'), // Reemplaza con la imagen de perfil
                ),
                SizedBox(
                    width: 16), // Espacio entre la imagen de perfil y el texto
                // Información del usuario
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre Completo del Usuario',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8), // Espacio entre las líneas de texto
                    Text(
                      'correo@example.com\nGénero: Masculino\nEstado: Activo',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
              height:
                  40), // Espacio entre la información del usuario y los botones de navegación
          // Botones de Navegación
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Alinea los botones en el centro con espacio equitativo
            children: [
              // Botón de Inicio (ícono de casa)
              ElevatedButton(
                onPressed: () {},
                child: Text('IA',
                    style: TextStyle(color: Colors.black)), // Texto negro
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 236, 236, 215),
                ),
              ),
              // Botón de Dispositivos
              ElevatedButton(
                onPressed: () {},
                child: Text('Dispositivos',
                    style: TextStyle(color: Colors.black)), // Texto negro
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 236, 236, 215),
                ),
              ),
              // Botón de Administradores
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página de Administradores
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Administradores()),
                  );
                },
                child: Text('Administradores',
                    style: TextStyle(color: Colors.black)), // Texto negro
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(255, 236, 236, 215),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
