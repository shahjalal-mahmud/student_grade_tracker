/// Represents a single academic subject with a name and a mark.
///
/// The mark is intentionally stored as a PRIVATE field (`_mark`) to
/// demonstrate encapsulation. External code can only read/update it
/// through the public [mark] getter/setter, and the setter enforces
/// the valid 0-100 range.
class Subject {
  /// The name of the subject (e.g. "Mathematics").
  final String name;

  /// Private backing field for the mark. Cannot be accessed directly
  /// from outside this file/class.
  double _mark;

  Subject({
    required this.name,
    required double mark,
  }) : _mark = mark;

  /// Public getter exposing the private mark.
  double get mark => _mark;

  /// Public setter that validates the mark before assigning it.
  /// Values outside 0-100 are ignored to keep data consistent.
  set mark(double value) {
    if (value >= 0 && value <= 100) {
      _mark = value;
    }
  }

  /// Computes the letter grade for this subject based on its mark.
  ///
  /// A => mark >= 80
  /// B => mark >= 65
  /// C => mark >= 50
  /// F => below 50
  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }
}