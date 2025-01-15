
/*
//luego de lo que te indiqué
1. agregar dependencias en pubspec.yaml
2. flutterfire configure //
3. firebase init
3.1. seleccionar hosting
3.2. seleccionar build/web
4. flutter build web
5. firebase deploy
*/
import 'package:flutter/material.dart';
import 'package:interfaz/providers/screen_provider.dart';
import 'package:interfaz/screens/dashboard.dart';
import 'package:provider/provider.dart';
//import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => Provider_pantalla(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //se establece tema oscuro
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}


