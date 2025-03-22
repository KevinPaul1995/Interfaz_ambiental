import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/globals.dart';
import 'package:interfaz/widgets/cristal.dart';
import 'package:interfaz/widgets/screen_3/humedad.dart';
import 'package:interfaz/widgets/screen_3/radiacion.dart';

import '../generarDatos.dart';
import '../widgets/screen_3/pm10.dart';
import '../widgets/screen_3/calor.dart';
import '../widgets/screen_3/pm25.dart';
import '../widgets/screen_3/temperatura.dart';

class Screen_3 extends StatefulWidget {
  const Screen_3({super.key});

  @override
  State<Screen_3> createState() => _Screen_3State();
}

class _Screen_3State extends State<Screen_3> {
  String dropdownValue = '5 minutos';

  @override
  Widget build(BuildContext context) {
    if (alto(context) > ancho(context)) {
      return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('real_time')
            .doc("datos_actuales")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(child: Center(child: CircularProgressIndicator()));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('El documento no existe'));
          }
          final data = snapshot.data!.data() as Map<String, dynamic>?;

          // Ejemplo: Leer campos específicos
          final double grados = data?['temperatura'] ?? 'Campo no disponible';
          final int calor = data?['calor'] ?? 'Campo no disponible';
          final int radiacion = data?['radiacion'] ?? 'Campo no disponible';
          final double pm10 = data?['pm10'] ?? 'Campo no disponible';
          final double pm25 = data?['pm25'] ?? 'Campo no disponible';
          final double humedad = data?['humedad'] ?? 'Campo no disponible';

          return Container(
            padding: EdgeInsets.symmetric(
                vertical: alto(context) * 0.01, horizontal: ancho(context) * 0.005),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.012,
                  alto: alto(context) * 0.08,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: ['5 minutos', '10 minutos', '15 minutos']
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: TemperatureChart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: CalorChart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: RadiacionChart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: pm10Chart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: pm25Chart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
                Cristal(
                  ancho: ancho(context) - alto(context) * 0.01 * 2,
                  alto: alto(context) * 0.32,
                  child: Container(
                    child: Center(
                      child: HumedadChart(
                        minutos: dropdownValue == '5 minutos'
                            ? 5
                            : dropdownValue == '10 minutos'
                                ? 10
                                : 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Text(
          "Por favor gire su dispositivo",
          style: TextStyle(
              fontSize: max(20, ancho(context) * 0.02),
              color: Colors.greenAccent),
        ),
      );
    }
  }
}