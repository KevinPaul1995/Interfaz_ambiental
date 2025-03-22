import 'package:flutter/material.dart';

import '../../globals.dart';

class CalidadAire extends StatelessWidget {
  final double calidad;

  const CalidadAire({required this.calidad, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String equivalencia = calidad < 1
        ? "Óptimo"
        : calidad < 2
            ? "Bueno"
            : calidad < 4
                ? "Precaución"
                : calidad < 6
                    ? "Alerta"
                    : calidad < 8
                        ? "Alarma"
                        : "Emergencia";

    Widget getCalidadWidget() {
      switch (equivalencia) {
        case "Óptimo":
          return CalidadOptima();
        case "Bueno":
          return CalidadBuena();
        case "Precaución":
          return CalidadPrecaucion();
        case "Alerta":
          return CalidadAlerta();
        case "Alarma":
          return CalidadAlarma();
        case "Emergencia":
          return CalidadEmergencia();
        default:
          return Text('Calidad fuera de rango');
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ancho(context)*0.01),
        child: Center(
          child: getCalidadWidget(),
        ),
      ),
    );
  }
}

class CalidadOptima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'LA CALIDAD DEL AIRE OPTIMA\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• No es necesaria ninguna protección.\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r7.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalidadBuena extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'LA CALIDAD DEL AIRE ESTÁ DENTRO DE LA NORMA ECUATORIANA DE CALIDAD DE AIRE (NECA).\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• No es necesaria ninguna protección.\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r8.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalidadPrecaucion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'EL AIRE NO ES SALUDABLE PARA INDIVIDUOS EXTREMADAMENTE SENSIBLES (ENFERMOS CRÓNICOS Y CONVALECIENTES)\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• Individuos extremadamente sensibles deben evitar el ejercicio intenso',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        
        Text(
          '• Individuos extremadamente sensibles usen mascarilla',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Hidrátese continuamente (1.5 litros de agua al día)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r9.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r10.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r11.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalidadAlerta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'RIESGO PARA INDIVIDUOS SENSIBLES (ENFERMOS)\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• Evite el ejercicio intenso',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
       Text(
          '• Individuos extremadamente sensibles usen mascarilla',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Hidrátese continuamente (1.5 litros de agua al día)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r12.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r13.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r14.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalidadAlarma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'RIESGO PARA LA MAYORÍA DE LA POBLACIÓN Y PELIGROSOS PARA INDIVIDUOS SENSIBLES (ENFERMOS)\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• No realice ejercicio intenso',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• No realizar actividades al aire libre',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Hidrátese continuamente (1.5 litros de agua al día)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Evite el uso de lentes de contacto',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Use mascarilla',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r15.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r16.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r17.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r18.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r19.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalidadEmergencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'RIESGO PARA TODALA POBLACIÓN\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),  
        Text(
          '• No realice ejercicio',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• No realizar actividades al aire libre',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Hidrátese continuamente (1.5 litros de agua al día)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Evite el uso de lentes de contacto',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        Text(
          '• Use mascarilla',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ), 
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r20.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r21.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r22.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r23.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r24.png', // Ruta de la imagen
            height: 150, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

