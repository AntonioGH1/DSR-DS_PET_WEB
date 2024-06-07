import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Administradores extends StatefulWidget {
  @override
  _AdministradoresState createState() => _AdministradoresState();
}

class _AdministradoresState extends State<Administradores> {
  List<Admin> _admins = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchAdmins();
  }

  Future<void> _fetchAdmins() async {
    try {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/admins'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _admins = data.map((json) => Admin.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Error al obtener administradores');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al obtener administradores: $e';
        _isLoading = false;
      });
    }
  }

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : Padding(
                  padding: const EdgeInsets.fromLTRB(
                      70, 15, 70, 0), // Ajusta el padding
                  child: GridView.count(
                    crossAxisCount: 3, // Tres columnas
                    mainAxisSpacing:
                        20, // Espacio vertical entre las tarjetas reducido
                    crossAxisSpacing:
                        70, // Espacio horizontal entre las tarjetas reducido
                    children: List.generate(_admins.length, (index) {
                      return TarjetaPerfil(
                        nombreUsuario: _admins[index].nombre,
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

class Admin {
  final String id;
  final String nombre;
  final String correo;
  final String imagen;

  Admin(
      {required this.id,
      required this.nombre,
      required this.correo,
      required this.imagen});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['id'],
      nombre: json['nombre'],
      correo: json['correo'],
      imagen: json['imagen'],
    );
  }
}
