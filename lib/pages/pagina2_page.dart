import 'package:fl_estados/models/usuario.dart';
import 'package:fl_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text('Nombre: ${usuarioService.usuario!.nombre}')
          : const Text('Pagina 2'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: usuarioService.removerUsuario,
          )
        ],
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.usuario = Usuario(
                  nombre: 'Ronaldo',
                  edad: 25,
                  profesiones: ['Futbolista', 'Tenisista', 'Boxeador']
                );
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
                usuarioService.agregarProfesion();
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            )
          ],
         )
      ),
    );
  }
}