import 'package:flutter/material.dart';

import '../../globals.dart';

class IndiceCalor extends StatelessWidget {
  final double calor;

  const IndiceCalor({required this.calor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String equivalencia=calor<26?"Seguro":calor<32?"Precaución":calor<40?"Precaución extrema":calor<51?"Peligro":calor<92?"Peligro extremo":"Mortal";

    Widget getcalorWidget() {
      if(equivalencia=="Seguro"){
        return CalorSeguro();
      }
      else if(equivalencia=="Precaución"){
        return CalorPrecaucion();
      }
      else if(equivalencia=="Precaución extrema"){
        return CalorPrecaucionExtrema();
      }
      else if(equivalencia=="Peligro"){
        return CalorPeligro();
      }
      else if(equivalencia=="Peligro extremo"){
        return CalorPeligro();
      }
      else if(equivalencia=="Mortal"){
        return CalorMortal();
      }
      else {
        return Text('Índice de calor fuera de rango');
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(ancho(context)*0.01),
        child: Center(
          child: getcalorWidget(),
        ),
      ),
    );
  }
}

class CalorSeguro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'EL AMBIENTE ES SEGURO\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          'No es necesaria ninguna protección',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r25.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalorPrecaucion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'EXISTE RIESGO DE FATIGA\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite realizar actividad física',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite una exposición prolongada en el ambiente',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r26.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r27.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalorPrecaucionExtrema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'POSIBLE GOLPE DE CALOR PARA TODA LA POBLACIÓN.\nRIESGOS MARES PARA NIÑOS, PERSONAS DE LA TERCERA EDAD, ENFERMOS CRÓNICOS O PERSONAS QUE TOMEN MEDICAMENTOS\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite realizar actividad física',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Use ropa ligera y transpirable',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Hidrátese lo suficiente',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Busque zonas donde pueda mantenerse fresco',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite el café y las bebidas muy dulces (favorecen la deshidratación)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r28.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r30.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r31.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r32.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r29.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalorPeligro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'POSIBLE GOLPE DE CALOR PARA TODA LA POBLACIÓN.\nRIESGOS MARES PARA NIÑOS, PERSONAS DE LA TERCERA EDAD, ENFERMOS CRÓNICOS O PERSONAS QUE TOMEN MEDICAMENTOS\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• No realice actividad física',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Use ropa ligera y transpirable',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Hidrátese lo suficiente',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Busque zonas donde pueda mantenerse fresco',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Refrésquese con agua fría cuando sea necesario',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite el café y las bebidas muy dulces (favorecen la deshidratación)',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r28.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r30.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r31.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r32.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r39.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/r29.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalorPeligroExtremo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'Índice de calor peligro extremo',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Evite salir de casa',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Manténgase en lugares con aire acondicionado',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        Text(
          '• Beba agua constantemente',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/indice_calor/peligro_extremo.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}

class CalorMortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'VALORES MORTALES PARA EL SER HUMANO\n',
          style: TextStyle(fontSize: ancho(context)*0.05, color: Colors.white),
          textAlign: TextAlign.left,
        ),
        
        SizedBox(height: 20),
        Center(
          child: Image.asset(
            'assets/R40.png', // Ruta de la imagen
            height: 120, // Ajustar el tamaño de la imagen
          ),
        ),
      ],
    );
  }
}