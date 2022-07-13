import 'package:fl_estados/controllers/usuario_controller.dart';
import 'package:fl_estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    
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
                usuarioCtrl.cargarUsuario(Usuario(
                  nombre: 'Ronaldo',
                  edad: 25
                ));
                Get.snackbar(
                  'Usuario establecido',
                  'El usuario ${usuarioCtrl.usuario.value.nombre} ha sido cargado',
                  backgroundColor: Colors.white,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ],
                  duration: const Duration(seconds: 2),
                );
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(32);
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion('Profesión #${usuarioCtrl.profesionesCount + 1}');
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              child: const Text('Cambiar tema', style: TextStyle(color: Colors.white)),
            )
          ],
         )
      ),
    );
  }
}