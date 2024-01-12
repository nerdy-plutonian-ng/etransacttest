import 'package:flutter/material.dart';

typedef EmptyValidator = String? Function(String?);

typedef OnChange = Function(String, String, String);

class AppTextBox extends StatelessWidget {
  const AppTextBox({
    super.key,
    required this.validator,
    required this.label,
    required this.placeholder,
    required this.onChange,
  });

  final EmptyValidator validator;
  final String label;
  final String placeholder;
  final OnChange onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            onChanged: (text) => onChange,
            decoration: InputDecoration(
              isDense: true,
              border: const OutlineInputBorder(),
              hintText: placeholder,
            ),
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}
