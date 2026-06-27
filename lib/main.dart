import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'providers/subject_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/navigation_provider.dart';

/// Application entry point.
///
/// Wraps the app in a [MultiProvider] so every screen can access
/// [SubjectProvider], [ThemeProvider], and [NavigationProvider]
/// without any setState() being used anywhere in the project.
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}