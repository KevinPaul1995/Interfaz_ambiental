import 'package:flutter/material.dart';
import 'package:interfaz/providers/screen_provider.dart';
import 'package:provider/provider.dart';

import '../globals.dart';
import 'screen_1.dart';
import 'screen_2.dart';
import 'screen_3.dart';

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
        child: BottomNavigationBar(
          currentIndex: navigationProvider.currentIndex,
          onTap: (index) {
            navigationProvider.changeScreen(index); // Cambia el índice al pulsar un botón
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tiempo real"),
            BottomNavigationBarItem(icon: Icon(Icons.manage_history), label: "Intervalos"),
            BottomNavigationBarItem(icon: Icon(Icons.timelapse_sharp), label: "Últimos minutos"),
          ],
        ),
      ),
    );
  }
}