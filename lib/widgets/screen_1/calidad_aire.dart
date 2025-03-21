import 'dart:math';

import 'package:demoji/demoji.dart';
import 'package:flutter/material.dart';
import 'package:interfaz/widgets/texto.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:animate_do/animate_do.dart';
import '../../globals.dart';

class CalidadAire extends StatefulWidget {
  final double calidad;
  final double valorPM10;
  final double valorPM25;
  const CalidadAire({
    required this.calidad,
    required this.valorPM10,
    required this.valorPM25,
    super.key,
  });

  @override
  State<CalidadAire> createState() => _CalidadAireState();
}

class _CalidadAireState extends State<CalidadAire> {
  @override
  Widget build(BuildContext context) {
    print('depurar: CalidadAire: ${widget.calidad}');
    //colores y mensaje
    Color color1 = Colors.white;
    Color color2 = const Color.fromARGB(255, 98, 254, 82);
    Color color3 = const Color.fromARGB(255, 195, 195, 195);
    Color color4 = const Color.fromARGB(255, 255, 248, 61);
    Color color5 = const Color.fromARGB(255, 255, 182, 27);
    Color color6 = const Color.fromARGB(255, 235, 61, 62);
    Color color_mensaje=widget.calidad<10 ?color1:widget.calidad<20?color2:widget.calidad<40?color3:widget.calidad<60?color4:widget.calidad<80?color5:color6;
    //String mensaje=widget.calidad<10?"Óptimo":widget.calidad<20?"Bueno":widget.calidad<40?"Precaución":widget.calidad<60?"Alerta":widget.calidad<80?"Alarma":"Emergencia";
    String mensaje="vacío";
    int calidad=0;
    //si pm25 está entre 0 y 25 y pm10 entre 0 o 50, mensaje = "Óptimo"
    if(widget.valorPM25>=0 && widget.valorPM25<=25 || widget.valorPM10>=0 && widget.valorPM10<=50){
      mensaje="Óptimo";
      color_mensaje=color1;
      calidad=5;
    }
    else if(widget.valorPM25>=26 && widget.valorPM25<=50 || widget.valorPM10>=51 && widget.valorPM10<=100){
      mensaje="Bueno";
      color_mensaje=color2;
      calidad=15;
    }
    else if(widget.valorPM25>=51 && widget.valorPM25<=150 || widget.valorPM10>=101 && widget.valorPM10<=250){
      mensaje="Precaución";
      color_mensaje=color3;
      calidad=30;
    }
    else if(widget.valorPM25>=151 && widget.valorPM25<=250 || widget.valorPM10>=251 && widget.valorPM10<=400){
      mensaje="Alerta";
      color_mensaje=color4;
      calidad=50;
    }
    else if(widget.valorPM25>=251 && widget.valorPM25<=350 || widget.valorPM10>=401 && widget.valorPM10<=500){
      mensaje="Alarma";
      color_mensaje=color5;
      calidad=70;
    }
    else if(widget.valorPM25>350|| widget.valorPM10>500){
      mensaje="Emergencia";
      color_mensaje=color6;
      calidad=90;
    }
    else{
      mensaje="N/A";
      color_mensaje=Colors.cyanAccent;
      calidad=0;
    }




    

    // emojis y gauge
    double anchoGauge = alto(context) * 0.070;
    double altoDisponibleGauge = alto(context) * 0.12-alto(context)*0.015*2;
    double tamEmoji = alto(context) * 0.02;
    double emojiRadius = alto(context)*0.0019; // Radio del gauge para posicionar el emoji
    double hipotenusa=altoDisponibleGauge*0.8; //distancia de los emojis
    double gaugeCenterX = altoDisponibleGauge; // Centro aproximado del gauge
    double gaugeCenterY = 0; // Centro aproximado del gauge
    List<double> angles = [180,158,130,90,50,5];
    List<double> emojiLeft = [];
    List<double> emojiTop = [];

    // Generar los valores
    for (int i = 0; i < angles.length; i++) {
      double angle = angles[i]; // Calcular ángulo

      double left = gaugeCenterX + hipotenusa * cos(angle * (3.14159 / 180));
      double top = gaugeCenterY + hipotenusa * sin(angle * (3.14159 / 180));

      emojiLeft.add(left);
      emojiTop.add(top);
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(alto(context)*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              //color: Colors.red,
              //width: ancho(context) * 0.4,
             //height: alto(context) * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text( textAlign: TextAlign.center, "CALIDAD DEL AIRE\n(PM2,5 Y PM10)", style: TextStyle(fontSize: max(18,ancho(context)*0.018))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ancho(context)*0.015, vertical: alto(context)*0.003), 
                    //colocar bordes redondeados
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: color_mensaje,
                    ),
                    
                    child: TextoConBorde(
                      mensaje: mensaje, 
                      tam: 
                      max(22,ancho(context)*0.02),
                      relleno: Colors.white, 
                      borde: Colors.black
                    )
                  ),
                ],
              ),
            ),
            Container(
              //color: Colors.blue,
              width: altoDisponibleGauge*2,
              child: Stack(
                children: [
                  SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                        radiusFactor: 1.6,//espacio disponible
                        centerX: 0.5,
                        centerY: 1,
                        showAxisLine: false,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 10,
                        maximum: 110,
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 10,
                            endValue: 10.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 10.5,
                            endValue: 20,
                            color: Colors.white,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 20,
                            endValue: 20.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 20.5,
                            endValue: 30,
                            color: const Color.fromARGB(255, 98, 254, 82),
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 30,
                            endValue: 30.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          
                          GaugeRange(
                            startValue: 30.5,
                            endValue: 50,
                            color: const Color.fromARGB(255, 195, 195, 195),
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 50,
                            endValue: 50.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 50.5,
                            endValue: 70,
                            color: const Color.fromARGB(255, 255, 248, 61),
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 70,
                            endValue: 70.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 70.5,
                            endValue: 90,
                            color: const Color.fromARGB(255, 255, 182, 27),
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 90,
                            endValue: 90.5,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 90.5,
                            endValue: 109.5,
                            color: const Color.fromARGB(255, 235, 61, 62),
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                          GaugeRange(
                            startValue: 109.5,
                            endValue: 110,
                            color: Colors.black,
                            startWidth: anchoGauge,
                            endWidth: anchoGauge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Posicionando el emoji dinámicamente
                  Positioned(
                    left:emojiLeft[0]-tamEmoji/2,
                    bottom: emojiTop[0],
        
                    child: AnimatedEmoji(
                      AnimatedEmojis.smile,
                      size: tamEmoji,
                    ),
                  ),
                  Positioned(
                    left:emojiLeft[1]-tamEmoji/2,
                    bottom: emojiTop[1]-tamEmoji*0.15,
        
                    child: AnimatedEmoji(
                      AnimatedEmojis.slightlyHappy,
                      size: tamEmoji,
                    ),
                  ),
                  Positioned(
                    left:emojiLeft[2]-tamEmoji/2,
                    bottom: emojiTop[2]-tamEmoji*0.35,
        
                    child: AnimatedEmoji(
                      AnimatedEmojis.diagonalMouth,
                      size: tamEmoji,
                    ),
                  ),
                  Positioned(
                    left:emojiLeft[3]-tamEmoji/2,
                    bottom: emojiTop[3]-tamEmoji/2,
        
                    child: AnimatedEmoji(
                      AnimatedEmojis.neutralFace,
                      size: tamEmoji,
                    ),
                  ),
                  Positioned(
                    left:emojiLeft[4]-tamEmoji/2,
                    bottom: emojiTop[4]-tamEmoji*0.35,
        
                    child: AnimatedEmoji(
                      AnimatedEmojis.anguished,
                      size: tamEmoji,
                    ),
                  ),
                  Positioned(
                    left:emojiLeft[5]-tamEmoji*0.9,
                    bottom: emojiTop[5],
                    child: Bounce(
                      from: 3,
                      infinite: true,
                      duration: Duration(milliseconds: 1300),
        
                      child: Text(Demoji.warning, style: TextStyle(fontSize: tamEmoji*0.8,color: Colors.black,fontWeight: FontWeight.bold),)),
                  ),
                  // indicador dle valor de la calidad 
                  SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                        radiusFactor: 1.5,//espacio disponible
                        centerX: 0.5,
                        centerY: 1,
                        showAxisLine: false,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 180,
                        endAngle: 0,
                        minimum: 10,
                        maximum: 110,
                        pointers: <GaugePointer>[
                          NeedlePointer(
                            value: calidad.toDouble()+10,
                            enableAnimation: true,
                            animationDuration: 1000,
                            animationType: AnimationType.ease,
                            needleColor: const Color.fromARGB(255, 0, 168, 252),
                            needleStartWidth: 0.2,
                            needleEndWidth: 4,
                            needleLength: emojiRadius,
                            knobStyle: KnobStyle(
                              knobRadius: 0.08,
                              sizeUnit: GaugeSizeUnit.factor,
                              borderColor: const Color.fromARGB(255, 0, 194, 253),
                              color: const Color.fromARGB(255, 244, 75, 75),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
