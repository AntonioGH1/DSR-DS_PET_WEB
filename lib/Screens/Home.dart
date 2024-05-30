import 'package:flutter/material.dart';
import 'Principal.dart'; // Importa la página Principal.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Adjust this for the primary color
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              CircleAvatar(
                backgroundImage: AssetImage('../assets/usuario.png'),
                radius: 80,
              ),
              SizedBox(height: 20),
              Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ancho del TextField
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Matrícula',
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Bordes circulares
                      borderSide: BorderSide(color: Colors.grey), // Borde gris
                    ),
                    filled: true, // Relleno activado
                    fillColor: Colors.grey[200], // Color de fondo gris
                  ),
                  maxLines: 1, // Ajusta el campo de entrada a una sola línea
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ancho del TextField
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Bordes circulares
                      borderSide: BorderSide(color: Colors.grey), // Borde gris
                    ),
                    filled: true, // Relleno activado
                    fillColor: Colors.grey[200], // Color de fondo gris
                  ),
                  maxLines: 1, // Ajusta el campo de entrada a una sola línea
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página Principal cuando se presione el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Principal()), // Redirige a Principal.dart
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
            ],
          ),
        ),
      ),
    );
  }
}
