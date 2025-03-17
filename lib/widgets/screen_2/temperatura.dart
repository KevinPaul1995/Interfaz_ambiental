import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../../globals.dart';

class TemperatureChart extends StatefulWidget {
  final int horaInicio;
  final bool simular;

  TemperatureChart({required this.horaInicio, this.simular = true});

  @override
  _TemperatureChartState createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  List<FlSpot> temperatureData = [];
  late String horaInicio;
  late String horaFin;

  @override
  void initState() {
    super.initState();
    horaInicio = "${widget.horaInicio}:00";
    horaFin = "${widget.horaInicio + 1}:00";
    if(widget.simular) {
      generarDatosSimulados();
    } else {
      fetchTemperatureData();
    }
  }

  Future<void> fetchTemperatureData() async {
    // 1️⃣ Obtener la fecha actual
    DateTime now = DateTime.now();

    // 2️⃣ Determinar el último día válido según la hora actual
    DateTime lastValidDay = now.hour < widget.horaInicio + 1 ? now.subtract(Duration(days: 1)) : now;

    // 3️⃣ Formatear fecha para Firestore
    String fechaFiltro = DateFormat("yyyy-MM-dd").format(lastValidDay);
    String startTime = "$fechaFiltro $horaInicio:00";
    String endTime = "$fechaFiltro $horaFin:00";

    try {
      // 4️⃣ Consultar Firestore en la colección "historial"
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('historial3') // 🔥 Tu colección
          .where('tiempo', isGreaterThanOrEqualTo: startTime)
          .where('tiempo', isLessThan: endTime)
          .orderBy('tiempo') // 🔥 Necesario para ordenar los datos correctamente
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
    double minY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a < b ? a : b) - 0 : 0;
    double maxY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a > b ? a : b) + 0   : 0; 
    
    double avgY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a + b) / temperatureData.length : 0;

    String formatValue(double value) {
      return value % 1 == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(1);
    }

    return SafeArea(
      minimum: EdgeInsets.all(pantalla(context) * 0.01), // 🔹 Agregar padding de 8
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10-pantalla(context) * 0.005), // 🔹 Bordes redondeados
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temperatura °C   ",
                  style: TextStyle(fontSize: pantalla(context) * 0.018),
                ),
                Column(
                  children: [
                    Text(
                      "Min: ${formatValue(minY)}°C, Max: ${formatValue(maxY)}°C",
                      style: TextStyle(fontSize: pantalla(context) * 0.018),
                    ),
                    Text(
                      "Prom: ${formatValue(avgY)}°C",
                      style: TextStyle(fontSize: pantalla(context) * 0.018),
                    ),
                  ],
                ),
              ],
            ), // 🔹 Mostrar rango de temperatura
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10), // 🔹 Agregar padding de 8
            child: temperatureData.isEmpty
                ? Center(child: Text("No hay datos disponibles"))
                : Row(
                    children: [
                      Container(
                        width: pantalla(context) * 0.04, // 🔹 Ancho del gráfico
                        height: pantalla(context) * 0.5, // 🔹 Alto del gráfico
                        //color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text("${(40)}", style: TextStyle(fontSize: pantalla(context) * 0.015))
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("${(0).toStringAsFixed(1)}", style: TextStyle(fontSize: pantalla(context) * 0.015))),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: LineChart(
                                LineChartData(
                                  minY: 0,
                                  maxY: 45,
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
                                      color: const Color.fromARGB(157, 105, 219, 12),
                                      barWidth: 0.5, // 🔹 Ajustar el grosor de la línea
                                      isStrokeCapRound: true,
                                      belowBarData: BarAreaData(show: true, color: const Color.fromARGB(99, 9, 116, 170)),
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
                                for (int i = 0; i <= 60; i += 15)
                                  Text("$i min", style: TextStyle(fontSize: pantalla(context) * 0.015)),
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
