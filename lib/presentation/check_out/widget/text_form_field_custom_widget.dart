import 'package:flutter/material.dart';

class TextFormFieldCustomWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String errorText;
  final TextInputType keyboardType;

  const TextFormFieldCustomWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.errorText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}
