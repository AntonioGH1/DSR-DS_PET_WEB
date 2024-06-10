import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Principal.dart'; // Importa la página Principal.dart

class LoginPage extends StatelessWidget {
  final TextEditingController matriculaController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final String url = 'http://127.0.0.1:8000/login'; // URL del backend
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    final Map<String, String> body = {
      'Matricula': matriculaController.text,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('matricula', matriculaController.text);

        // Autenticación exitosa, navegar a la página principal
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Principal()),
        );
      } else {
        // Autenticación fallida, mostrar mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error de autenticación: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error al enviar solicitud HTTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al conectar con el servidor: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
                  controller: matriculaController,
                  decoration: InputDecoration(
                    hintText: 'Matrícula',
                    prefixIcon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _login(context); // Llamar a la función de inicio de sesión
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
