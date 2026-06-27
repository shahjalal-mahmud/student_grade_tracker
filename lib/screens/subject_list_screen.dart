import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../widgets/subject_card.dart';

/// Displays the full list of subjects with swipe-to-delete support.
///
/// This screen is fully reactive via [Consumer<SubjectProvider>] —
/// no local state and no setState() calls.
class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, subjectProvider, _) {
        final subjects = subjectProvider.subjects;

        if (subjects.isEmpty) {
          return _buildEmptyState(context);
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            final subject = subjects[index];

            return Dismissible(
              // Identity-based key so Flutter can correctly track each
              // item even as the underlying list shrinks/reorders.
              key: ValueKey(identityHashCode(subject)),
              direction: DismissDirection.horizontal,
              background: _buildDismissBackground(
                context,
                alignment: Alignment.centerLeft,
              ),
              secondaryBackground: _buildDismissBackground(
                context,
                alignment: Alignment.centerRight,
              ),
              onDismissed: (_) {
                final removedName = subject.name;
                subjectProvider.removeSubject(subject);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$removedName removed')),
                );
              },
              child: SubjectCard(subject: subject),
            );
          },
        );
      },
    );
  }

  /// The red "delete" background shown behind a card while swiping.
  Widget _buildDismissBackground(BuildContext context, {required Alignment alignment}) {
    final theme = Theme.of(context);
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.error,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(Icons.delete_outline, color: theme.colorScheme.onError),
    );
  }

  /// Friendly empty state shown when no subjects have been added yet.
  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fact_check_outlined,
              size: 88,
              color: theme.colorScheme.secondary.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 20),
            Text(
              'No Subjects Added',
              style: theme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Add a subject from the "Add" tab to get started.',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}