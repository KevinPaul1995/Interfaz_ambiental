import 'dart:math';

import 'package:flutter/material.dart';

import 'package:interfaz/globals.dart';

class Humedad extends StatefulWidget {
  final double humedad;
  const Humedad({required this.humedad,super.key});

  @override
  State<Humedad> createState() => _HumedadState();
}

class _HumedadState extends State<Humedad> {
  @override
  Widget build(BuildContext context) {
    double altoBarra=alto(context)*0.03;
    double anchoBarra=ancho(context)*0.8;
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("HUMEDAD RELATIVA",style: TextStyle(fontSize: max(20,ancho(context)*0.02),)),
            //AGREGA UN GAUGE LINEAL
            Container(
              width: anchoBarra+ancho(context)*0.05,
              //color: Colors.amber,
              child: Column(
                children: [
                  Stack (
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //agregar dos container iguales de diferentes colores
                          Container(
                                    
                            width: anchoBarra*widget.humedad/100,
                            height: altoBarra,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 153, 64),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),bottomLeft: Radius.circular(5.0),topRight: Radius.circular(widget.humedad==100?5:0),bottomRight: Radius.circular(widget.humedad==100?5:0))
                            ),
                          ),
                          Container(
                            width:anchoBarra- anchoBarra*widget.humedad/100,
                            height: altoBarra,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              //redondear solo esquinas derechas
                              borderRadius: BorderRadius.only(topRight: Radius.circular(5.0),bottomRight: Radius.circular(5.0),topLeft: Radius.circular(widget.humedad==0?5:0),bottomLeft: Radius.circular(widget.humedad==0?5:0))
                      
                            ),
                          ),
                        ],
                      ),
                      //agregar un row de 9 containers que simulen barras separadoras
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          Container(
                            width: 0.5,
                            height: altoBarra,
                            color: Colors.black,
                          ),
                          
                        ],
                      ),
                      // Crear una row de 3 textos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("SECO",style: TextStyle(color:Colors.black ,fontSize: max(18,ancho(context)*0.018),)),
                          Text("ÓPTIMO",style: TextStyle(color:Colors.black,fontSize: max(18,ancho(context)*0.018),)),
                          Text("HÚMEDO",style: TextStyle(color:Colors.black,fontSize: max(18,ancho(context)*0.018),)),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("   0%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      ),
                      Text(" 20%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      ),
                      Text(" 40%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      ),
                      Text("60%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      ),
                      Text("80%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      ),
                      Text("100%",style: 
                        TextStyle(
                          color: Colors.white,
                          fontSize: max(12,alto(context)*0.016)
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}