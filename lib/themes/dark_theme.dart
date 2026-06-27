import 'package:flutter/material.dart';

/// Fully custom Material 3 dark theme. Mirrors [LightTheme] but with a
/// dark, low-luminance palette. No widget should ever need to reach for
/// a hardcoded color — everything routes through this ThemeData.
class DarkTheme {
  DarkTheme._();

  static const Color _primary = Color(0xFFD0BCFF);
  static const Color _onPrimary = Color(0xFF381E72);
  static const Color _secondary = Color(0xFFCCC2DC);
  static const Color _surface = Color(0xFF1C1B1F);
  static const Color _onSurface = Color(0xFFE6E1E5);
  static const Color _surfaceVariant = Color(0xFF49454F);
  static const Color _error = Color(0xFFF2B8B5);
  static const Color _cardColor = Color(0xFF2B2930);
  static const Color _appBarColor = Color(0xFF211F26);

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _surface,
    colorScheme: const ColorScheme.dark(
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _secondary,
      onSecondary: Color(0xFF332D41),
      surface: _surface,
      onSurface: _onSurface,
      surfaceContainerHighest: _surfaceVariant,
      error: _error,
      onError: Color(0xFF601410),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _appBarColor,
      foregroundColor: _onSurface,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: _onSurface,
      ),
      iconTheme: IconThemeData(color: _onSurface),
    ),
    cardTheme: CardThemeData(
      color: _cardColor,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _surfaceVariant.withValues(alpha: 0.35),
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
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xFFCAC4D0)),
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
      backgroundColor: _appBarColor,
      selectedItemColor: _primary,
      unselectedItemColor: Color(0xFF938F99),
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