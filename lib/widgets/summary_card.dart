import 'package:flutter/material.dart';

/// A small reusable stat tile used on the Summary screen
/// (e.g. "Total Subjects", "Average Mark").
class SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? accentColor;

  const SummaryCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = accentColor ?? theme.colorScheme.primary;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(value, style: theme.textTheme.titleLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}