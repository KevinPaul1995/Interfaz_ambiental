import 'package:flutter/material.dart';

class IndiceUV extends StatelessWidget {
  final int radiacion;

  const IndiceUV({required this.radiacion, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pantalla de Índice UV\nRadiación: $radiacion',
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
