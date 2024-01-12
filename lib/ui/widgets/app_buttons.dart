import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  const AppButtons(
      {super.key,
      required this.action,
      required this.label,
      this.isTonal = false});

  final VoidCallback action;
  final String label;
  final bool isTonal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: isTonal
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.primary,
          foregroundColor: isTonal
              ? Theme.of(context).colorScheme.onPrimaryContainer
              : Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: action,
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
