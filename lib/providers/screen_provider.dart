import 'package:flutter/material.dart';

class Provider_pantalla with ChangeNotifier {
  int _indice = 0;

  int get currentIndex => _indice;

  void changeScreen(int index) {
    _indice = index;
    notifyListeners(); // Notifica a los widgets que dependen de este estado
  }
}