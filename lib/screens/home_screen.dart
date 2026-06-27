import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

/// The single host screen of the app. Hosts a [BottomNavigationBar]
/// with 3 tabs (Add, Subjects, Summary) and an AppBar with a
/// light/dark theme toggle.
///
/// Tab switching is driven entirely by [NavigationProvider] — no
/// setState() is used.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Widget> _screens = [
    const AddSubjectScreen(),
    const SubjectListScreen(),
    const SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Student Grade Tracker'),
            actions: [
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return IconButton(
                    tooltip: themeProvider.isDarkMode
                        ? 'Switch to Light Mode'
                        : 'Switch to Dark Mode',
                    icon: Icon(
                      themeProvider.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    ),
                    onPressed: themeProvider.toggleTheme,
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          // IndexedStack preserves each tab's state while switching,
          // without needing setState() to manage visibility manually.
          body: IndexedStack(
            index: navProvider.currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navProvider.currentIndex,
            onTap: navProvider.setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                label: 'Subjects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_outlined),
                label: 'Summary',
              ),
            ],
          ),
        );
      },
    );
  }
}