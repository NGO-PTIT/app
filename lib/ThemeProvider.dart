import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;
  double _fontSize = 14.0;
  ThemeProvider(this._themeData);

  getTheme() => _themeData;
  double get fontSize => _fontSize;
  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void setFontSize(double fontSize) {
    _fontSize = fontSize;
    notifyListeners();
  }
}