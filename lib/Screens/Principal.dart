import 'package:cat_admin/Widgets/BotonesNavegacion.dart';
import 'package:cat_admin/Widgets/CerrarSesionDialog.dart';
import 'package:cat_admin/Widgets/PerfilUsuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late Future<Map<String, dynamic>> _futureAdminData;

  @override
  void initState() {
    super.initState();
    _futureAdminData = _fetchAdminData();
  }

  Future<Map<String, dynamic>> _fetchAdminData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? matricula = prefs.getString('matricula');

    if (matricula == null) {
      throw Exception('No matricula found in preferences');
    }

    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/admin?matricula=$matricula'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar los datos del administrador');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CerrarSesionDialog();
                },
              );
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _futureAdminData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final adminData = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PerfilUsuario(
                  nombre: adminData['Nombre'],
                  correo: adminData['Correo'],
                  edad: adminData['Edad'],
                  turno: adminData['Turno'],
                ),
                SizedBox(height: 40),
                BotonesNavegacion(),
              ],
            );
          }
        },
      ),
    );
  }
}
