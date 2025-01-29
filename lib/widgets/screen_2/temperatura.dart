  import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:fl_chart/fl_chart.dart';
  import 'package:intl/intl.dart';

  class TemperatureChart extends StatefulWidget {
    @override
    _TemperatureChartState createState() => _TemperatureChartState();
  }

  class _TemperatureChartState extends State<TemperatureChart> {
    List<FlSpot> temperatureData = [];
    String horaInicio = "12:00";
    String horaFin = "13:00";

    @override
    void initState() {
      super.initState();
      fetchTemperatureData();
    }

    Future<void> fetchTemperatureData() async {
      // 1️⃣ Obtener la fecha actual
      DateTime now = DateTime.now();

      // 2️⃣ Determinar el último día válido según la hora actual
      DateTime lastValidDay = now.hour < 13 ? now.subtract(Duration(days: 1)) : now;

      // 3️⃣ Formatear fecha para Firestore
      String fechaFiltro = DateFormat("yyyy-MM-dd").format(lastValidDay);
      String startTime = "$fechaFiltro 21:00:00";
      String endTime = "$fechaFiltro 22:00:00";

      try {
        // 4️⃣ Consultar Firestore en la colección "historial"
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('historial') // 🔥 Tu colección
            .where('tiempo', isGreaterThanOrEqualTo: startTime)
            .where('tiempo', isLessThan: endTime)
            .orderBy('tiempo') // 🔥 Necesario para ordenar los datos correctamente
            .get();

        List<FlSpot> data = [];
        int index = 0;

        for (var doc in querySnapshot.docs) {
          double temperatura = doc['temperatura'].toDouble();
          data.add(FlSpot(index.toDouble(), temperatura));
          index++;
        }

        setState(() {
          temperatureData = data;
        });
      } catch (e) {
        print("Error al obtener datos: $e");
      }
    }

    @override
    Widget build(BuildContext context) {
      double minY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a < b ? a : b) : 0;
      double maxY = temperatureData.isNotEmpty ? temperatureData.map((e) => e.y).reduce((a, b) => a > b ? a : b) : 0;

      return Scaffold(
        appBar: AppBar(
          title: Text("Temperatura (12h-13h) - Min: $minY°C, Max: $maxY°C"), // 🔹 Mostrar rango de temperatura
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0), // 🔹 Agregar padding de 8
          child: temperatureData.isEmpty
              ? Center(child: Text("No hay datos disponibles"))
              : LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false, // 🔥 Oculta los valores en el eje X inferior
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false, // 🔥 Oculta los valores en el eje Y izquierdo
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
                        color: Colors.blue,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                        dotData: FlDotData(show: false), // ❌ Oculta los puntos para una línea continua
                      ),
                    ],
                  ),
                ),
        ),
      );
    }
  }
