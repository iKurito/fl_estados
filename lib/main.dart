import 'package:fl_estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter/material.dart';

import 'package:fl_estados/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UsuarioCubit>(
          create: (context) => UsuarioCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => const Pagina1Page(),
          'pagina2': (_) => const Pagina2Page(),
        }
      ),
    );
  }
}