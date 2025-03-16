
/*
//luego de lo que te indiqué
1. agregar dependencias en pubspec.yaml
2. flutterfire configure // enlaza proyecto de fistore con proyecto flutter
3. firebase init
3.1. seleccionar hosting
3.2. seleccionar build/web
4. flutter build web
5. firebase deploy

git add .
git commit -m "correcciones termometro y streambuilder realizado"
git push origin main
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interfaz/firebase_options.dart';
import 'package:interfaz/providers/screen_provider.dart';
import 'package:interfaz/screens/dashboard.dart';
import 'package:provider/provider.dart';
//import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );  
  
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


