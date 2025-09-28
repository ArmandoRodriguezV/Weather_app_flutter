import 'dart:math';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  List<double> _wind = [42, 12.4]; // [ángulo, velocidad de viento]
  String _time = "Soleado";
  int _moisture = 40;
  double _temperature = 28;
  int _height = 420;

  List<double> get wind => _wind;
  String get time => _time;
  int get moisture => _moisture;
  double get temperature => _temperature;
  int get height => _height;

  // Getter que devuelve un icono según el tipo de tiempo
  IconData get weatherIcon {
    switch (_time) {
      case "Soleado":
        return Icons.wb_sunny;
      case "Nublado":
        return Icons.cloud;
      default:
        return Icons.help_outline; // Por si hay un valor inesperado
    }
  }

  double truncateDouble(double value, int decimals) {
    double mod = pow(10.0, decimals).toDouble();
    return (value * mod).truncateToDouble() / mod;
  }

  void changeData() {
    Random rand = Random();
    _wind = [
      truncateDouble(rand.nextDouble() * 360, 2), // ángulo truncado
      truncateDouble(rand.nextDouble() * 20, 2)   // velocidad truncada
    ];
    _time = (rand.nextBool()) ? "Soleado" : "Nublado";
    _moisture = rand.nextInt(101);
    _temperature = truncateDouble(rand.nextDouble() * 40, 2); // temperatura truncada
    _height = rand.nextInt(4001);

    notifyListeners();
  }
}
