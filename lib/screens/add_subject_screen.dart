import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../widgets/custom_textfield.dart';
import '../utils/validators.dart';

/// Screen for adding a new subject with validation.
///
/// NOTE: This is a [StatefulWidget] purely to own the [TextEditingController]s
/// and [GlobalKey<FormState>] for their lifecycle (and to dispose them
/// correctly). setState() is never called anywhere in this class — all
/// data mutations go through [SubjectProvider], and Flutter's text field
/// widgets manage their own rendering through their controllers.
class AddSubjectScreen extends StatefulWidget {
  const AddSubjectScreen({super.key});

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _markController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final subjectProvider = Provider.of<SubjectProvider>(context, listen: false);

      final name = _nameController.text.trim();
      final mark = double.parse(_markController.text.trim());

      subjectProvider.addSubject(name, mark);

      _nameController.clear();
      _markController.clear();
      FocusScope.of(context).unfocus();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$name added successfully!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive max width so the form looks good on tablets too.
          final maxWidth = constraints.maxWidth > 600 ? 500.0 : double.infinity;

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),
                      Icon(Icons.school_outlined, size: 64, color: theme.colorScheme.primary),
                      const SizedBox(height: 12),
                      Text(
                        'Add a New Subject',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Enter the subject details below',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 28),
                      CustomTextField(
                        controller: _nameController,
                        label: 'Subject Name',
                        prefixIcon: Icons.book_outlined,
                        validator: Validators.validateName,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _markController,
                        label: 'Marks (0 - 100)',
                        prefixIcon: Icons.score_outlined,
                        keyboardType: TextInputType.number,
                        validator: Validators.validateMark,
                      ),
                      const SizedBox(height: 28),
                      ElevatedButton.icon(
                        onPressed: _submitForm,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Subject'),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}