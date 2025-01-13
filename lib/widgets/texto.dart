import 'package:flutter/material.dart';
class TextoConBorde extends StatelessWidget {
  final String mensaje; // El mensaje a mostrar
  final double tam; // Tamaño de la fuente
  final Color relleno; // Color de relleno del texto
  final Color borde; // Color del contorno del texto

  const TextoConBorde({
    Key? key,
    required this.mensaje,
    required this.tam,
    required this.relleno,
    required this.borde,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Texto con contorno
        Text(
          textAlign: TextAlign.center,
          mensaje,
          style: TextStyle(
            fontSize: tam,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.8 // Ajusta el grosor del contorno
              ..color = borde, // Color del contorno
          ),
        ),
        // Texto con relleno
        Text(
          mensaje,
          textAlign: TextAlign.center,
          
          style: TextStyle(
            fontSize: tam,
            fontWeight: FontWeight.bold,
            color: relleno, // Color del relleno
          ),
        ),
      ],
    );
  }
}