import 'package:flutter/material.dart';

/// Manages the current [ThemeMode] (light/dark) for the whole app.
///
/// The AppBar toggle button calls [toggleTheme], which notifies all
/// listeners (the root [MaterialApp]) to rebuild with the new theme.
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  /// The currently active theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Convenience flag for checking dark mode state in the UI.
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  /// Switches between light and dark mode.
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}