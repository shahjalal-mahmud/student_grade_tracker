import 'package:flutter/material.dart';
import '../models/subject.dart';

/// Displays a single [Subject] (name, mark, grade) inside a styled card.
///
/// Used inside the [Dismissible] wrapper on the Subject List screen.
/// All colors are pulled from the active theme.
class SubjectCard extends StatelessWidget {
  final Subject subject;

  const SubjectCard({super.key, required this.subject});

  /// Maps a letter grade to a representative color from the theme's
  /// color scheme, so passing/failing grades are visually distinct
  /// without introducing any hardcoded `Colors.xxx` values.
  Color _gradeColor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    switch (subject.grade) {
      case 'A':
      case 'B':
        return scheme.primary;
      case 'C':
        return scheme.secondary;
      default:
        return scheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradeColor = _gradeColor(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: gradeColor.withValues(alpha: 0.15),
              child: Text(
                subject.grade,
                style: theme.textTheme.titleLarge?.copyWith(color: gradeColor),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: theme.textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mark: ${subject.mark.toStringAsFixed(1)}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: theme.colorScheme.secondary),
          ],
        ),
      ),
    );
  }
}