import 'dart:math';

import 'package:flutter/material.dart';

double ancho(context){
  return MediaQuery.sizeOf(context).width;
}
double alto(context){
  return MediaQuery.sizeOf(context).height;
}

double pantalla(BuildContext context) {
  //retorna la diagonal de la altura y el alto
  double diagonal = sqrt(ancho(context) * ancho(context) + alto(context) * alto(context));
  return diagonal;

}

// función que convierte grados Celsius a Fahrenheit
double mapValue(double value, double inMin, double inMax, double outMin, double outMax) {
  return (value - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}
double farenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}