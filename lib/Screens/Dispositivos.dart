import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Widgets/dispositivos_grid.dart';
import '../Widgets/Apagar.dart'; // Importa el archivo Apagar.dart

class Dispositivos extends StatefulWidget {
  @override
  _DispositivosState createState() => _DispositivosState();
}

class _DispositivosState extends State<Dispositivos> {
  List dispositivos = []; // Lista para almacenar los dispositivos

  @override
  void initState() {
    super.initState();
    _fetchDispositivos(); // Llama a la función para obtener dispositivos
  }

  Future<void> _fetchDispositivos() async {
    try {
      final response = await http.get(Uri.parse(
          'https://eouww9yquk.execute-api.us-east-1.amazonaws.com/machines/get_machines_user?id=4d3dfcab-c809-453a-9871-aa128193cf21'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          dispositivos = data;
        });
      } else {
        throw Exception('Error al obtener dispositivos');
      }
    } catch (e) {
      print('Error: $e');
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '<<Dispositivos Pet+>>',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(90, 15, 90, 0),
        child: DispositivosGrid(
            dispositivos:
                dispositivos), // Pasa la lista de dispositivos al widget DispositivosGrid
      ),
    );
  }
}
