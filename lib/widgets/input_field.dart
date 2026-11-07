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

        filled: true,
        fillColor: const Color.fromARGB(255, 223, 220, 213),

        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 70, 105, 96),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 198, 170, 108),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 34, 79, 83),
            width: 1.5,
          ),
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
