import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../widgets/summary_card.dart';

/// Displays aggregate statistics about all tracked subjects.
///
/// Updates automatically whenever [SubjectProvider] notifies listeners
/// (e.g. after adding/removing a subject) thanks to [Consumer].
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, subjectProvider, _) {
        final theme = Theme.of(context);

        return SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Use a 2-column grid on wider screens, single column otherwise.
              final isWide = constraints.maxWidth > 600;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Summary', style: theme.textTheme.headlineMedium),
                    const SizedBox(height: 4),
                    Text(
                      'An overview of your academic performance',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                    _buildOverallGradeBanner(context, subjectProvider),
                    const SizedBox(height: 20),
                    isWide
                        ? _buildGridLayout(subjectProvider)
                        : _buildListLayout(subjectProvider),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// Large banner highlighting the class's overall grade.
  Widget _buildOverallGradeBanner(BuildContext context, SubjectProvider provider) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Overall Grade',
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            provider.overallGrade,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Average: ${provider.averageMark.toStringAsFixed(1)}',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onPrimary.withValues(alpha: 0.85),
            ),
          ),
        ],
      ),
    );
  }

  List<SummaryCard> _cards(SubjectProvider provider, BuildContext context) {
    final theme = Theme.of(context);
    return [
      SummaryCard(
        label: 'Total Subjects',
        value: '${provider.totalSubjects}',
        icon: Icons.menu_book_outlined,
      ),
      SummaryCard(
        label: 'Average Mark',
        value: provider.averageMark.toStringAsFixed(1),
        icon: Icons.show_chart,
      ),
      SummaryCard(
        label: 'Passing Subjects',
        value: '${provider.passingCount}',
        icon: Icons.check_circle_outline,
        accentColor: theme.colorScheme.primary,
      ),
      SummaryCard(
        label: 'Failing Subjects',
        value: '${provider.failingCount}',
        icon: Icons.highlight_off,
        accentColor: theme.colorScheme.error,
      ),
    ];
  }

  Widget _buildListLayout(SubjectProvider provider) {
    return Builder(
      builder: (context) => Column(
        children: _cards(provider, context),
      ),
    );
  }

  Widget _buildGridLayout(SubjectProvider provider) {
    return Builder(
      builder: (context) {
        final cards = _cards(provider, context);
        return GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 2.4,
          children: cards,
        );
      },
    );
  }
}