import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:fl_estados/pages/pages.dart';
import 'package:fl_estados/services/usuario_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),
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