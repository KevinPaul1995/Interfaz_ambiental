import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interfaz/globals.dart';

import '../texto.dart';
class Temperatura extends StatefulWidget {
  final double grados;
  final double calor;
  const Temperatura({
    required this.grados,
    required this.calor,
    super.key
  });

  @override
  State<Temperatura> createState() => _TemperaturaState();
}

class _TemperaturaState extends State<Temperatura> {
  final Color color1=const Color.fromARGB(255,0,113,193);
  final Color color2=const Color.fromARGB(255,0,176,240,);
  final Color color3=const Color.fromARGB(255,254,255,0);
  final Color color4=const Color.fromARGB(255,255,192,0);
  final Color color5=const Color.fromARGB(255,254,0,0);


  final Color color6=const Color.fromARGB(255,60,169,52);
  final Color color7=const Color.fromARGB(255,252,205,0);
  final Color color8=const Color.fromARGB(255,246,169,42);
  final Color color9=const Color.fromARGB(255,229,78,31 );
  final Color color10=const Color.fromARGB(255,157,68,244);
  final Color color11=const Color.fromARGB(255,0,0,0);
  
 /*  final String imagen1="assets/t1.png";
  final String imagen2="assets/t2.png";
  final String imagen3="assets/t3.jpg";
  final String imagen4="assets/t4.jpg";
  final String imagen5="assets/t5.png"; */
  
  @override
  Widget build(BuildContext context) {
  Color color_calor=widget.calor<26?color6:widget.calor<32?color7:widget.calor<40?color8:widget.calor<51?color9:widget.calor<92?color10:color11;
  String mensaje_calor=widget.calor<26?"Seguro":widget.calor<32?"Precaución":widget.calor<40?"Precaución extrema":widget.calor<51?"Peligro":widget.calor<92?"Peligro extremo":"Mortal";
  // si grados convertidos a farenheit no está en el rango entre 80 -110
  // se muestra un mensaje de error
  if((farenheit(widget.grados)<80 || farenheit(widget.grados)>110)&&(widget.grados<40 || widget.grados>100)){
    print('depurar: temperatura fuera de rango');
    mensaje_calor="- - -";
    color_calor=const Color.fromARGB(255, 212, 211, 211);
  }
  
  


  Color color_temperaturas=widget.grados<0?color1:widget.grados<18?color2:widget.grados<24?color3:widget.grados<35?color4:color5;
  //String imagen=widget.grados<0?imagen1:widget.grados<18?imagen2:widget.grados<24?imagen3:widget.grados<35?imagen4:imagen5;
    return Padding(
      padding: EdgeInsets.all(alto(context)*0.01),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Text("TEMPERATURA", style: TextStyle(fontSize: max(18,ancho(context)*0.018))),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: alto(context)*0.25,
                      width: ancho(context)*0.25,
                      child: Stack(
                        children: [
                          Positioned(
                            top: alto(context)*0.001,
                            left: ancho(context)*0.00, 
                            right: ancho(context)*0.018,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("°C", style: TextStyle(color:Colors.black,fontSize: max(13,ancho(context)*0.01))),
                                //SizedBox(width: ancho(context)*0.07),
                                Text("°F", style: TextStyle(color:Colors.black,fontSize: max(13,ancho(context)*0.01))),
                              ],
                            ),
                          ),
                          Positioned(
                            top: alto(context)*0.02,
                            child: Termometro(
                              color: color_temperaturas,
                              grados: widget.grados, // Valor de prueba
                            ),
                          ),
                        ],
                      ),
                    ),
                
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //agregar una imagen de termometro
                        /* Padding(
                          padding: EdgeInsets.all(alto(context)*0.0),
                          child: Image.asset(
                            imagen, // Ruta de la imagen
                            height: alto(context) * 0.065, // Ajustar el tamaño de la imagen
                          ),
                        ), */
                        Container(
                          decoration: BoxDecoration(
                            color: color_temperaturas,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: TextoConBorde(
                              mensaje: " ${widget.grados} °C ", // Mensaje del texto
                              tam: max(22,ancho(context)*0.036), // Tamaño de la fuente
                              relleno: Colors.white, // Color del relleno
                              borde: Colors.black, // Color del borde
                            ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: color_temperaturas,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),                          
                          child: 
                          TextoConBorde(
                            // mostrar el valor con dos decimales
                            tam: max(22,ancho(context)*0.036), // Tamaño de la fuente
                            mensaje: " ${farenheit(widget.grados).toStringAsFixed(2)} °F ", // Mensaje del texto                            tam: max(15,ancho(context)*0.036), // Tamaño de la fuente
                            relleno: Colors.white, // Color del relleno
                            borde: Colors.black, // Color del borde
                          ),
                        ),
                        Column(
                          children: [
                            Text("ÍNDICE DE CALOR", style: TextStyle(fontSize: max(20,ancho(context)*0.020))),
                            Container(
                              width: ancho(context)*0.45,
                              decoration: BoxDecoration(
                                color: color_calor,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),                              
                              child: Center(child: 
                                Padding(
                                  padding: EdgeInsets.all(alto(context)*0.01),
                                  child: TextoConBorde(
                                    mensaje: " $mensaje_calor ", // Mensaje del texto
                                    tam: max(22,ancho(context)*0.033), // Tamaño de la fuente
                                    relleno: Colors.white, // Color del relleno
                                    borde: Colors.black, // Color del borde
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Termometro extends StatefulWidget {
  final double grados;
  final Color color;
  const Termometro({
    required this.grados,
    required this.color,
    super.key});

  @override
  State<Termometro> createState() => _TermometroState();
}

class _TermometroState extends State<Termometro> {
  @override
  Widget build(BuildContext context) {
    double tam_escala = 0.16;
    double tam_rojo = mapValue(widget.grados-2, -10, 50, 0, tam_escala);
    double tam_blanco=tam_escala-tam_rojo;
    return Row( // contiene 3 columnas
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column( //columna de la escala c
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(// conatainer de la escala c
              height: alto(context)*tam_escala+alto(context)*0.02,
              width: ancho(context)*0.08,
              decoration: BoxDecoration(
                //color: Colors.red,
              ),
              child: VerticalScale_C(initialValue: 50, finalValue: -10, numberOfLines: 7)
            ),
            SizedBox(height: alto(context)*0.07),
          ],
        ),
        Container( //container del termometro
          height: alto(context)*0.25, //el mismo tam del container blanco
          width: ancho(context)*0.07,
          decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 54, 244, 139),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: alto(context)*0.009,
              ),
              Container(//rect blanco
                height: alto(context)*tam_blanco,
                width: ancho(context)*0.04,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.color,
                    width: 0.2),
                  color: const Color.fromARGB(255, 225, 222, 222),
                ),
              ),
              Container(//rect rojo
                height: alto(context)*tam_rojo,
                width: ancho(context)*0.04,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: widget.color,
                      width: 0.2),),
                  color: widget.color,
                ),
              ),
              Transform.translate(//circulo
                //offset: Offset(0, -alto(context)*0.00),
                offset: Offset(0, -alto(context)*0.025),
                child: Center(
                  child: Container(
                    height: alto(context)*0.075,
                    width: alto(context)*0.075,
                    decoration: BoxDecoration(
                      color: widget.color,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column( //columna de la escala F
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(// conatainer de la escala c
              height: alto(context)*tam_escala+alto(context)*0.02,
              width: ancho(context)*0.08,
              decoration: BoxDecoration(
                
                //color: Colors.red,
              ),
              child: VerticalScale_F(initialValue: 50, finalValue: -10, numberOfLines: 7)
            ),
            SizedBox(height: alto(context)*0.07),
          ],
        ),
      ],
    );
  }
}

class VerticalScale_C extends StatelessWidget {
  final double initialValue;
  final double finalValue;
  final int numberOfLines;

  const VerticalScale_C({
    Key? key,
    required this.initialValue,
    required this.finalValue,
    required this.numberOfLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcular el intervalo entre los valores
    double step = (finalValue - initialValue) / (numberOfLines - 1);

    // Generar la lista de valores para la escala
    List<double> values = List.generate(
      numberOfLines,
      (index) => initialValue + (index * step),
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: values.map((value){
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              
              // Valor al lado de la línea
              Text(
                value.toStringAsFixed(0), // Mostrar el valor con 1 decimal
                style: TextStyle(
                  fontSize: alto(context)*0.0155,
                  color: Colors.black,  
                  ),
              ),
              // Línea de la escala
              Container(
                width: ancho(context)*0.01, // Longitud de la línea
                height: 1, // Grosor de la línea
                color: Colors.black,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class VerticalScale_F extends StatelessWidget {
  final double initialValue;
  final double finalValue;
  final int numberOfLines;

  const VerticalScale_F({
    Key? key,
    required this.initialValue,
    required this.finalValue,
    required this.numberOfLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calcular el intervalo entre los valores
    double initialValueF=farenheit(initialValue);
    double finalValueF=farenheit(finalValue);
    double step = (finalValueF - initialValueF) / (numberOfLines - 1);

    // Generar la lista de valores para la escala
    List<double> values = List.generate(
      numberOfLines,
      (index) => initialValueF + (index * step),
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: values.map((value){
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: ancho(context)*0.01, // Longitud de la línea
                height: 1, // Grosor de la línea
                color: Colors.black,
              ),
              // Valor al lado de la línea
              Text(
                value.toStringAsFixed(0), // Mostrar el valor con 1 decimal
                style: TextStyle(
                  fontSize: alto(context)*0.0155,
                  color: Colors.black,  
                  ),
              ),
              // Línea de la escala
              
            ],
          );
        }).toList(),
      ),
    );
  }
}