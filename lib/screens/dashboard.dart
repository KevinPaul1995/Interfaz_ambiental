import 'package:flutter/material.dart';
import 'package:interfaz/providers/screen_provider.dart';
import 'package:provider/provider.dart';

import '../globals.dart';
import 'screen_1.dart';
import 'screen_2.dart';
import 'screen_3.dart';
import 'screen_4.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<Provider_pantalla>(context);

    // Lista de pantallas
    final screens = [
      Screen_1(),
      Screen_2(),
      Screen_3(),
      Screen_4(), // Asegurarse de que Screen_4 está en la lista
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Tótem Medidor de Condiciones Ambientales"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: alto(context) * 0.01, horizontal: ancho(context) * 0.005),
          child: screens[navigationProvider.currentIndex],
        ),
      ), // Cambia la pantalla según el índice actual
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: alto(context) * 0.01, horizontal: ancho(context) * 0.005),
        child: Container(
          color: Colors.black, // Fondo negro
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home, size: 30, color: Colors.white), // Ícono más grande
                        onPressed: () {
                          navigationProvider.changeScreen(0);
                        },
                      ),
                      Text("Tiempo real", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.manage_history, size: 30, color: Colors.white), // Ícono más grande
                        onPressed: () {
                          navigationProvider.changeScreen(1);
                        },
                      ),
                      Text("Intervalos", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.timelapse_sharp, size: 30, color: Colors.white), // Ícono más grande
                        onPressed: () {
                          navigationProvider.changeScreen(2);
                        },
                      ),
                      Text("Últimos minutos", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.recommend, size: 30, color: Colors.white), // Ícono más grande
                        onPressed: () {
                          navigationProvider.changeScreen(3);
                        },
                      ),
                      Text("Recomendaciones", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}