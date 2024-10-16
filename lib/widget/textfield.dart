  import 'package:flutter/material.dart';


  class CustomTextField extends StatelessWidget {
    final String? Function(String?)? validator;
    final String label;
    final TextEditingController controller;

    const CustomTextField({
      Key? key,
      required this.validator,
      required this.label,
      required this.controller,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );
    }
  }