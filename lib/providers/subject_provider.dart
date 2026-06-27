import 'package:flutter/foundation.dart';
import '../models/subject.dart';

/// Holds the list of subjects and exposes derived statistics.
///
/// This is the single source of truth for subject data. All screens
/// listen to this provider via [Consumer] / [Provider.of] instead of
/// using setState().
class SubjectProvider extends ChangeNotifier {
  // Private list of subjects. Exposed only as an unmodifiable view.
  final List<Subject> _subjects = [];

  /// Read-only access to the current subjects.
  List<Subject> get subjects => List.unmodifiable(_subjects);

  /// Adds a new subject to the list and notifies listeners.
  void addSubject(String name, double mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  /// Removes the given subject (by identity) and notifies listeners.
  void removeSubject(Subject subject) {
    _subjects.remove(subject);
    notifyListeners();
  }

  /// Total number of subjects currently tracked.
  int get totalSubjects => _subjects.length;

  /// Average mark across all subjects, computed using [.map()] to
  /// extract the marks before reducing them to a single average.
  double get averageMark {
    if (_subjects.isEmpty) return 0.0;

    // .map() usage: transform Subject objects into a list of marks.
    final List<double> marksOnly = _subjects.map((subject) => subject.mark).toList();

    final double total = marksOnly.fold(0.0, (sum, mark) => sum + mark);
    return total / marksOnly.length;
  }

  /// Subjects that are passing (mark >= 50), computed using [.where()].
  List<Subject> get passingSubjects =>
      _subjects.where((subject) => subject.mark >= 50).toList();

  /// Subjects that are failing (mark < 50), computed using [.where()].
  List<Subject> get failingSubjects =>
      _subjects.where((subject) => subject.mark < 50).toList();

  /// Convenience counts derived from the filtered lists above.
  int get passingCount => passingSubjects.length;
  int get failingCount => failingSubjects.length;

  /// Overall grade based on the class average mark.
  ///
  /// A => average >= 80
  /// B => average >= 65
  /// C => average >= 50
  /// F => below 50
  String get overallGrade {
    final double avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }
}