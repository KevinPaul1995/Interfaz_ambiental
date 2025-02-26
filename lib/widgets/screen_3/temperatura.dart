import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../../globals.dart';

class TemperatureChart extends StatefulWidget {
  final int minutos;
  final bool simular;

  TemperatureChart({required this.minutos, this.simular = true});

  @override
  _TemperatureChartState createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  List<FlSpot> temperatureData = [];
  late String startTime;
  late String endTime;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    endTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(now);
    startTime = DateFormat("yyyy-MM-dd HH:mm:ss").format(now.subtract(Duration(minutes: widget.minutos)));
    if(widget.simular) {
      generarDatosSimulados();
    } else {
      fetchTemperatureData();
    }
  }

  Future<void> fetchTemperatureData() async {
    try {
      // Consultar Firestore en la colección "historial"
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('historial3') // Tu colección
          .where('tiempo', isGreaterThanOrEqualTo: startTime)
          .where('tiempo', isLessThan: endTime)
          .orderBy('tiempo') // Necesario para ordenar los datos correctamente
          .get();

      List<FlSpot> data = [];
      int index = 0;

      for (var doc in querySnapshot.docs) {
        double temperatura = doc['temperatura'].toDouble();
        String tiempo = doc['tiempo'];
        data.add(FlSpot(index.toDouble(), temperatura));
        print("Tiempo: $tiempo, Temperatura: $temperatura"); // Imprimir en consola
        index++;
      }

      setState(() {
        temperatureData = data;
      });

      print("Cantidad de elementos consultados: ${querySnapshot.docs.length}"); // Imprimir cantidad de elementos
    } catch (e) {
      print("Error al obtener datos: $e");
    }
  }

  void generarDatosSimulados() {
    print('depurar: random elements');
    final random = Random();
    List<FlSpot> data = [];
    for (int i = 0; i < 700; i++) {
      double temperatura = double.parse((random.nextDouble()*2+20 ).toStringAsFixed(2)); // 18 a 27
      data.add(FlSpot(i.toDouble(), temperatura));
    }
    setState(() {
      temperatureData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    double minY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a < b ? a : b) - 3 : 0;
    double maxY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 3 : 0;

    return SafeArea(
      minimum: EdgeInsets.all(pantalla(context) * 0.01), // 🔹 Agregar padding de 8
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10-pantalla(context) * 0.005), // 🔹 Bordes redondeados
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Temperatura °C     Min: ${minY + 3}°C, Max: ${maxY - 3}°C",
              style: TextStyle(fontSize: pantalla(context) * 0.02),
            ), // 🔹 Mostrar rango de temperatura
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), // 🔹 Agregar padding de 8
            child: temperatureData.isEmpty
                ? Center(child: Text("No hay datos disponibles"))
                : Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: LineChart(
                                LineChartData(
                                  minY: minY,
                                  maxY: maxY,
                                  titlesData: FlTitlesData(
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false, // 🔥 Oculta los valores en el eje X inferior
                                      ),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        minIncluded: false,
                                        maxIncluded: false,
                                        showTitles: false, // 🔥 Oculta los valores en el eje Y izquierdo
                                        interval: 4, // 🔹 Intervalo de 1 en 1
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false), // 🔥 Oculta los valores en el eje X superior
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: false, // 🔥 Oculta los valores en el eje Y derecho
                                      ),
                                    ),
                                  ),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: temperatureData,
                                      isCurved: true, // 🔹 Suaviza la línea
                                      color: const Color.fromARGB(157, 234, 255, 12),
                                      barWidth: 0.5, // 🔹 Ajustar el grosor de la línea
                                      isStrokeCapRound: true,
                                      belowBarData: BarAreaData(show: true, color: const Color.fromARGB(98, 189, 9, 224)),
                                      dotData: FlDotData(show: false), // ❌ Oculta los puntos para una línea continua
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // agregar una columna que muestre valores de 0 a 60 con intervalos de 15
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i <= 5; i += 1)
                                  Text("${widget.minutos*i/5} min", style: TextStyle(fontSize: pantalla(context) * 0.015)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
