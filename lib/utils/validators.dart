/// Centralized form validation logic used by [AddSubjectScreen].
///
/// Keeping validators here avoids duplicating validation rules across
/// widgets and keeps the screen code focused on layout/UX.
class Validators {
  Validators._();

  /// Validates the subject name field — must not be empty.
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Subject name cannot be empty';
    }
    return null;
  }

  /// Validates the marks field:
  /// - required
  /// - must be numeric
  /// - must be between 0 and 100 (inclusive)
  static String? validateMark(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Marks are required';
    }

    final double? parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Marks must be a valid number';
    }

    if (parsed < 0 || parsed > 100) {
      return 'Marks must be between 0 and 100';
    }

    return null;
  }
}