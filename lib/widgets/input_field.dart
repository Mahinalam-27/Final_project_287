import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller, keyboardType, labelText, hintText, suffixIcon, validator;

  const InputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field is empty";
        }

        if (validator != null) {
          return validator(value);
        }

        return null;
      },
    );
  }
}