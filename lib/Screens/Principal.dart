import 'package:cat_admin/Widgets/CerrarSesionDialog.dart';
import 'package:cat_admin/Widgets/BotonesNavegacion.dart';
import 'package:cat_admin/Widgets/PerfilUsuario.dart';
import 'package:flutter/material.dart';

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
