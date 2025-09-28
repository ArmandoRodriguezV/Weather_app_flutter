import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _theme = true; // true: claro, false oscuro
  Color _background = Color.fromARGB(255, 188, 188, 188);
  Color _banner = Color.fromARGB(255, 235, 235, 235);

  List<Color> _text = [
    Color(0xFF000000), // negro principal
    Color(0xFF555555), // gris medio
    Color(0xFFAAAAAA), // gris claro
  ];

  Color get background => _background;
  Color get banner => _banner;
  List<Color> get textColors => _text;
  bool get state => _theme;

  void changeTheme() {
    _theme = !_theme;

    if (_theme) {
      _background = Color.fromARGB(255, 188, 188, 188);
      _banner = Color.fromARGB(255, 236, 236, 236);
      _text = [
        Color(0xFF000000), // negro principal
        Color(0xFF555555), // gris medio
        Color(0xFFAAAAAA), // gris claro // acento
      ];
    } else {
      _background = Color.fromARGB(255, 66, 66, 66);
      _banner = Color.fromARGB(255, 47, 47, 47);
      _text = [
        Color(0xFFFFFFFF), // blanco principal
        Color(0xFFAAAAAA), // gris medio
        Color(0xFF777777), // gris oscuro/ acento
      ];
    }

    notifyListeners();
  }
}
