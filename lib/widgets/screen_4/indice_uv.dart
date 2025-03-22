import 'package:flutter/material.dart';

import '../../globals.dart';

class IndiceUV extends StatelessWidget {
  final int radiacion;

  const IndiceUV({required this.radiacion, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getRadiacionWidget() {
      if (radiacion >= 0 && radiacion <= 2) {
        return RadiacionBaja();
      } else if (radiacion >= 3 && radiacion <= 7) {
        return RadiacionModerada();
      } else if (radiacion >= 8) {
        return RadiacionAlta();
      } else {
        return Text('Radiación fuera de rango');
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ancho(context)*0.01),
        child: Center(
          child: getRadiacionWidget(),
        ),
      ),
    );
  }
}

class RadiacionBaja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'NO NECESITA PROTECCIÓN',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Center(
          child: Image.asset(
            'assets/r1.png', // Ruta de la imagen
            height: 100, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class RadiacionModerada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'NECESITA PROTECCIÓN\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          '• Mantenerse en la sombra',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Usar camisa',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Usar crema de protección solar',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Usar sombrero',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/r2.png', // Ruta de la primera imagen
                height: alto(context) * 0.2, // Ajustar el tamaño de la imagen
              ),
            ),
            SizedBox(width: 10),
            Center(
              child: Image.asset(
                'assets/r3.png', // Ruta de la segunda imagen
                height: alto(context) * 0.2, // Ajustar el tamaño de la imagen
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RadiacionAlta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text(
          'NECESITA PROTECCIÓN EXTRA\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          '• Evite salir de la casa',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Mantenerse en la sombra',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Imprescindible el uso de camisa',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Imprescindible el uso de crema de protección solar',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Imprescindible el uso de sombrero',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/r4.png', // Ruta de la primera imagen
                height: alto(context) * 0.2, // Ajustar el tamaño de la imagen
              ),
            ),
            SizedBox(width: 10),
            Center(
              child: Image.asset(
                'assets/r5.png', // Ruta de la segunda imagen
                height: alto(context) * 0.2, // Ajustar el tamaño de la imagen
              ),
            ),
            SizedBox(width: 10),
            Center(
              child: Image.asset(
                'assets/r6.png', // Ruta de la tercera imagen
                height: alto(context) * 0.2, // Ajustar el tamaño de la imagen
              ),
            ),
          ],
        ),
      ],
    );
  }
}
