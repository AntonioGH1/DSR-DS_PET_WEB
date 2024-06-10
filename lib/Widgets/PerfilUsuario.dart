import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  final String nombre;
  final String correo;
  final String edad;
  final String turno;

  const PerfilUsuario({
    Key? key,
    required this.nombre,
    required this.correo,
    required this.edad,
    required this.turno,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto de perfil (más pequeña)
          CircleAvatar(
            radius: 80, // Reduzco el tamaño de la imagen de perfil
            backgroundImage: AssetImage(
              '../assets/usuario.png', // Reemplaza con la imagen de perfil
            ),
          ),
          SizedBox(width: 16), // Espacio entre la imagen de perfil y el texto
          // Información del usuario
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombre,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8), // Espacio entre las líneas de texto
              Text(
                '$correo\nEdad: $edad\nTurno: $turno',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
