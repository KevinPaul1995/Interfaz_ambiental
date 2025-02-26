import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class GenerarDatosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Center(
        child: ElevatedButton(
          onPressed: () async {
            await generarDatos();
          },
          child: Text('Generar Datos'),
        ),
      )
    ;
  }

  Future<void> generarDatos() async {
    final random = Random();
    final firestore = FirebaseFirestore.instance;
    DateTime startTime = DateTime.parse("2025-02-25 12:00:00");
    DateTime endTime = DateTime.parse("2025-02-25 15:00:00");

    for (DateTime currentTime = startTime;
        currentTime.isBefore(endTime);
        currentTime = currentTime.add(Duration(seconds: 5))) {
          print('Generando datos en ${currentTime.toString().split('.').first}');

          // Genera datos aleatorios para cada tipo de medida con dos decimales
        await firestore.collection('historial3').add({
          'calor': random.nextInt(11) + 20, // 20 a 30
          'humedad': random.nextInt(21) + 40, // 40 a 60
          'pm10': double.parse((random.nextDouble() * 10).toStringAsFixed(2)), // 0 a 10
          'pm25': double.parse((random.nextDouble() * 10).toStringAsFixed(2)), // 0 a 10
          'radiacion': double.parse((random.nextDouble() * 10).toStringAsFixed(2)), // 0 a 10
          'temperatura': double.parse((random.nextDouble() * 9 + 18).toStringAsFixed(2)), // 18 a 27
          'tiempo': currentTime.toString().split('.').first, // Formato correcto
        });
    }

    print('Datos generados');
  }
}
