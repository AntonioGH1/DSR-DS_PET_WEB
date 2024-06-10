import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Administradores extends StatefulWidget {
  @override
  _AdministradoresState createState() => _AdministradoresState();
}

class _AdministradoresState extends State<Administradores> {
  List _admins = [];
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
          await http.get(Uri.parse('http://127.0.0.1:8000/api/admins'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _admins = data;
          _isLoading = false;
        });
      } else {
        throw Exception(
            'Error al obtener administradores: ${response.statusCode}');
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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '<<Admins Pet+>>',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: _admins.length,
                    itemBuilder: (context, index) {
                      final nombreUsuario = _admins[index]['nombre'] != null
                          ? _admins[index]['nombre'].toString()
                          : 'Nombre no disponible';
                      final idUsuario = _admins[index]['id'] != null
                          ? _admins[index]['id'].toString()
                          : 'ID no disponible';
                      return TarjetaPerfil(
                        nombreUsuario: nombreUsuario,
                        idUsuario: idUsuario,
                      );
                    },
                  ),
                ),
    );
  }
}

class TarjetaPerfil extends StatelessWidget {
  final String nombreUsuario;
  final String idUsuario;

  TarjetaPerfil({
    required this.nombreUsuario,
    required this.idUsuario,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color.fromARGB(255, 236, 236, 215),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/usuario.png'),
          ),
          SizedBox(height: 4),
          Text(
            'Activo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            nombreUsuario,
            textAlign: TextAlign.center,
          ),
          Text(
            'ID: $idUsuario',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
