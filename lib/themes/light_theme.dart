// File: lib/themes/light_theme.dart

import 'package:flutter/material.dart';

/// Fully custom Material 3 light theme.
///
/// Every visual aspect (colors, app bar, cards, inputs, text, buttons,
/// bottom navigation) is explicitly defined here so that widgets never
/// need to hardcode colors — they simply read from `Theme.of(context)`.
class LightTheme {
  LightTheme._();

  static const Color _primary = Color(0xFF6750A4);
  static const Color _onPrimary = Colors.white;
  static const Color _secondary = Color(0xFF625B71);
  static const Color _surface = Color(0xFFFFFBFE);
  static const Color _onSurface = Color(0xFF1C1B1F);
  static const Color _surfaceVariant = Color(0xFFE7E0EC);
  static const Color _error = Color(0xFFB3261E);

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _surface,
    colorScheme: const ColorScheme.light(
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _secondary,
      onSecondary: Colors.white,
      surface: _surface,
      onSurface: _onSurface,
      surfaceContainerHighest: _surfaceVariant,
      error: _error,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _primary,
      foregroundColor: _onPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _onPrimary,
      ),
      iconTheme: IconThemeData(color: _onPrimary),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _surfaceVariant.withValues(alpha: 0.5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: _primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: _error, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: _error, width: 2),
      ),
      labelStyle: const TextStyle(color: _secondary),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: _onSurface),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: _onSurface),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _onSurface),
      bodyLarge: TextStyle(fontSize: 16, color: _onSurface),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF49454F)),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: _onPrimary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        foregroundColor: _onPrimary,
        minimumSize: const Size.fromHeight(52),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        elevation: 1,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: _primary,
      unselectedItemColor: Color(0xFF79747E),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    iconTheme: const IconThemeData(color: _secondary),
    dividerColor: _surfaceVariant,
  );
}