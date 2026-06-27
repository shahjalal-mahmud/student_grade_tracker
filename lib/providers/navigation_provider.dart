import 'package:flutter/material.dart';

/// Tracks which tab of the [BottomNavigationBar] is currently active.
///
/// Using a provider for this (instead of setState in a StatefulWidget)
/// keeps HomeScreen fully reactive and consistent with the rest of the
/// app's "no setState()" requirement.
class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  /// The index of the currently selected tab (0, 1, or 2).
  int get currentIndex => _currentIndex;

  /// Updates the selected tab and notifies listeners to rebuild.
  void setIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}