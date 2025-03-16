import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interfaz/widgets/texto.dart';

import '../../globals.dart';

class Radiacion extends StatefulWidget {
  final double radiacion;
  const Radiacion({required this.radiacion,super.key});
  
  @override
  State<Radiacion> createState() => _RadiacionState();
}

class _RadiacionState extends State<Radiacion> {
  final Color color1=const Color.fromARGB(255,156,198,0);
  final Color color2=const Color.fromARGB(255,249,189,3,);
  final Color color3=const Color.fromARGB(255,255,144,0);
  final Color color4=const Color.fromARGB(255,245,77,38);
  final Color color5=const Color.fromARGB(255,160,69,208);
  String ruta1='assets/uv_bajo.png';
  String ruta2='assets/uv_moderado.png';
  String ruta3='assets/uv_alto.png';
  String ruta4='assets/uv_muy_alto.png';
  String ruta5='assets/uv_extremo.png';
  @override
  Widget build(BuildContext context) {
    Color color_mensaje=widget.radiacion<3?color1:widget.radiacion<6?color2:widget.radiacion<8?color3:widget.radiacion<11?color4:color5;
    String mensaje_radiacion=widget.radiacion<3?"Bajo":widget.radiacion<6?"Moderado":widget.radiacion<8?"Alto":widget.radiacion<11?"Muy alto":"Extremo";
    String ruta_icono=widget.radiacion<3?ruta1:widget.radiacion<6?ruta2:widget.radiacion<8?ruta3:widget.radiacion<11?ruta4:ruta5;
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: alto(context)*0.02),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,  
          children: [
            Text("ÍNDICE DE RADIACIÓN UV",style: TextStyle(fontSize: max(18,ancho(context)*0.018),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color_mensaje,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:  ancho(context)*0.01, vertical: alto(context)*0.005),
                    child: Center(// se centra un texto con borde
                      child: TextoConBorde(mensaje: "Nivel: ${widget.radiacion} / $mensaje_radiacion", tam: alto(context)*0.022, relleno: Colors.white, borde: Colors.black),
                    ),
                  ),
                ),
                Image.asset(ruta_icono,width: alto(context)*0.05,)

                //Icon(Icons.sunny, size: alto(context)*0.05, color: color_mensaje,),
              ],
            ),
          ],
        ),  
      ),
    );
  }
}