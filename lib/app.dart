import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

/// The root widget of the application.
///
/// Listens to [ThemeProvider] to switch between the custom light and
/// dark themes, and hosts the single [HomeScreen].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Student Grade Tracker',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.themeData,
      darkTheme: DarkTheme.themeData,
      themeMode: themeProvider.themeMode,
      home: const HomeScreen(),
    );
  }
}