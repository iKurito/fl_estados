import 'package:flutter/material.dart';

import 'package:fl_estados/models/models.dart';
import 'package:fl_estados/services/services.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
              ? Text('Nombre: ${snapshot.data.nombre}')
              : const Text('Pagina 2');
          },
        )        
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = Usuario(nombre: 'Ronaldo', edad: 25);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(32);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {

              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            )
          ],
         )
      ),
    );
  }
}