import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';

class Cristal extends StatelessWidget {
  final Widget child;
  final double ancho;
  final double alto;

  const Cristal({Key? key, required this.child, required this.ancho, required this.alto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassContainer.frostedGlass(
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.20), Colors.white.withOpacity(0.10)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        height: alto,
        width: ancho,
        borderRadius: BorderRadius.circular(10.0),
        child: child, // Mostrar el widget recibido como child
        borderColor: const Color.fromARGB(59, 255, 255, 255),
        borderWidth: 0.5,
        blur: 15,
      ),
    );
  }
}