import 'package:fl_estados/models/usuario.dart';
import 'package:fl_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
   
  const Pagina1Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: usuarioService.existeUsuario
        ? InformacionUsuario(usuario: usuarioService.usuario!)
        : const Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
    required this.usuario
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile(title: Text('Nombre: ${usuario.nombre}')),
            ListTile(title: Text('Edad: ${usuario.edad}')),
            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            // usuario.profesiones.isEmpty
            //   ? const Text('No hay profesiones')
            //   : ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: usuario.profesiones.length,
            //       itemBuilder: (context, index) => ListTile(title: Text(usuario.profesiones[index])),
            //     ),
            ...usuario.profesiones.map(
              (profesion) => ListTile(title: Text(profesion))
            ).toList(),
          ],
        ),
      )
    );
  }
}