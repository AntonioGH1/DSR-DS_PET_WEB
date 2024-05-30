import 'package:cat_admin/Widgets/BotonNavegacion.dart';
import 'package:flutter/material.dart';
import '../Screens/Administradores.dart'; // Importa el archivo Administradores.dart
import '../Screens/Dispositivos.dart'; // Importa el archivo Dispositivos.dart
import 'PerfilUsuario.dart'; // Importa el archivo PerfilUsuario.dart
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
          PerfilUsuario(),
          SizedBox(
              height:
                  40), // Espacio entre la información del usuario y los botones de navegación
          BotonesNavegacion(),
        ],
      ),
    );
  }
}

class BotonesNavegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BotonNavegacion(
          text: 'IA',
          onPressed: () {},
        ),
        BotonNavegacion(
          text: 'Dispositivos',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dispositivos()),
            );
          },
        ),
        BotonNavegacion(
          text: 'Administradores',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Administradores()),
            );
          },
        ),
      ],
    );
  }
}
