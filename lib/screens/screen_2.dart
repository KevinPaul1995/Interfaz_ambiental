import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/globals.dart';
import 'package:interfaz/widgets/cristal.dart';

import '../widgets/screen_2/temperatura.dart';

class Screen_2 extends StatefulWidget {
  const Screen_2({super.key});

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
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
          final double calor = data?['calor'] ?? 'Campo no disponible';
          final double radiacion = data?['radiacion'] ?? 'Campo no disponible';
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
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  
                  alto: alto(context)*0.32,
                  child: Container(
                    child: Center(child: TemperatureChart()),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.12,
                  child: Container(
                    child: Center(child: Text(data?['radiacion'].toString() ?? 'Campo no disponible')),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.16,
                  child: Container(
                    child: Center(child: Text(data?['pm10'].toString() ?? 'Campo no disponible')),
                  )
                ),
                Cristal(
                  ancho: ancho(context)-alto(context) * 0.01*2,
                  alto: alto(context)*0.13,
                  child: Container(
                    child: Center(child: Text(data?['humedad'].toString() ?? 'Campo no disponible')),
                  )
                )
              ],
            )
          
          );
        }
      );
    }
    else{
      return 
      Center(
        child: Text("Por favor gire su dispositivo"
          ,style: TextStyle(fontSize: max(20,ancho(context)*0.02),
              color: Colors.greenAccent
          ),
        ),
      );
      
    }
  }
}