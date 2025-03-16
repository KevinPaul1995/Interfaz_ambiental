import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/globals.dart';
import 'package:interfaz/widgets/cristal.dart';
import 'package:interfaz/widgets/screen_2/humedad.dart';
import 'package:interfaz/widgets/screen_2/pm10.dart';
import 'package:interfaz/widgets/screen_2/pm25.dart';
import 'package:interfaz/widgets/screen_2/radiacion.dart';

import '../generarDatos.dart';
import '../widgets/screen_2/calidad_aire.dart';
import '../widgets/screen_2/calor.dart';
import '../widgets/screen_2/temperatura.dart';

class Screen_2 extends StatefulWidget {
  const Screen_2({super.key});

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
  String dropdownValue = '12:00 a 13:00';

  @override
  Widget build(BuildContext context) {
    if(alto(context)>ancho(context)){
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
            padding: EdgeInsets.symmetric(vertical: alto(context) * 0.01, horizontal: ancho(context) * 0.005),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Cristal(
                  ancho: ancho(context)-alto(context) * 0.012,
                  alto: alto(context)*0.08,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: ['10:00 a 11:00', '11:00 a 12:00', '12:00 a 13:00', '13:00 a 14:00']
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
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: TemperatureChart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: CalorChart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: RadiacionChart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: pm10Chart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: pm25Chart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: HumedadChart(
                      horaInicio: dropdownValue == '10:00 a 11:00'
                          ? 10
                          : dropdownValue == '11:00 a 12:00'
                              ? 11
                              : dropdownValue == '12:00 a 13:00'
                                  ? 12
                                  : 13,
                    )),
                  )
                )
              ],
            )
          
          );
        }
      );
    }
    else{
      return GenerarDatosScreen();
      return
      Center(
        child: Text("Hola mundo"
          ,style: TextStyle(fontSize: max(20,ancho(context)*0.02),
              color: Colors.greenAccent
          ),
        ),
      );
      
    }
  }
}