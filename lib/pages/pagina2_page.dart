import 'package:fl_estados/bloc/user/user_bloc.dart';
import 'package:fl_estados/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
   
  const Pagina2Page({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final newUser = User(
                  nombre: 'Ronaldo', 
                  edad: 25, 
                  profesiones: [
                    'Futbol', 
                    'Basket', 
                    'Tenis', 
                  ],
                );
                userBloc.add(ActivateUser(newUser));
              },
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(32));
              },
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfession('Nueva Profesión'));
              },
              child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
            )
          ],
         )
      ),
    );
  }
}