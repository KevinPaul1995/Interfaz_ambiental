import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interfaz/globals.dart';
import 'package:interfaz/widgets/cristal.dart';
import 'package:interfaz/widgets/screen_1/calidad_aire.dart';
import 'package:interfaz/widgets/screen_1/humedad.dart';
import 'package:interfaz/widgets/screen_1/indice_radiacion.dart';
import 'package:interfaz/widgets/screen_1/temperatura.dart';

class Screen_1 extends StatefulWidget {
  const Screen_1({super.key});

  @override
  State<Screen_1> createState() => _Screen_1State();
}

class _Screen_1State extends State<Screen_1> {
  @override
  Widget build(BuildContext context) {
    if(alto(context)>ancho(context)){
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
                child: Center(child: Temperatura(grados: 33,calor: 28,)),
              )
            ),
            Cristal(
              ancho: ancho(context)-alto(context) * 0.01*2,
              alto: alto(context)*0.12,
              child: Container(
                child: Center(child: Radiacion(radiacion: 7)),
              )
            ),
            Cristal(
              ancho: ancho(context)-alto(context) * 0.01*2,
              alto: alto(context)*0.16,
              child: Container(
                child: Center(child: CalidadAire(calidad: 4)),
              )
            ),
            Cristal(
              ancho: ancho(context)-alto(context) * 0.01*2,
              alto: alto(context)*0.13,
              child: Container(
                child: Center(child: Humedad(humedad: 100)),
              )
            )
          ],
        )

      );
    }
    else{
      return 
      Expanded(child: 
        Center(
          child: Text("Por favor gire su dispositivo"
            ,style: TextStyle(fontSize: max(20,ancho(context)*0.02)
                
            ),
          ),
        )
      );
      
    }
  }
}