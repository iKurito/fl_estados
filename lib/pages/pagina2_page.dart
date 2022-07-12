import 'package:fl_estados/bloc/usuario/usuario_cubit.dart';
import 'package:fl_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Ronaldo',
                  edad: 25,
                  profesiones: [
                    'Futbol',
                    'Baloncesto',
                    'Tenis',
                  ],
                );
                usuarioCubit.seleccionarUsuario(newUser);
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(32);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            )
          ],
         )
      ),
    );
  }
}