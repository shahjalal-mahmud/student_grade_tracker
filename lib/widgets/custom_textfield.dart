import 'package:flutter/material.dart';

/// A reusable, theme-driven [TextFormField] wrapper.
///
/// Styling comes entirely from `Theme.of(context)` (via the global
/// [InputDecorationTheme] / [TextTheme]) — no hardcoded colors here.
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: theme.textTheme.bodyLarge,
      cursorColor: theme.colorScheme.primary,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: theme.colorScheme.secondary)
            : null,
      ),
    );
  }
}