import 'package:flutter/material.dart';
import 'Home.dart';

class InicioSesion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            CircleAvatar(
              backgroundImage: AssetImage('../assets/usuario.png'),
              radius: 80,
            ),
            SizedBox(height: 16),
            // Texto 'Administrador'
            Text(
              'Administrador',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Espacio entre el texto y el botón
            Spacer(),
            // Botón 'Iniciar Sesión'
            ElevatedButton(
              onPressed: () {
                // Navegar a la página Home cuando se presione el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 236, 236, 215),
                textStyle: TextStyle(fontSize: 16),
                padding: EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
              ),
            ),
            SizedBox(
                height: 50), // Espacio entre el botón y el final de la pantalla
          ],
        ),
      ),
    );
  }
}
