import 'package:flutter/material.dart';

class NewPasswordTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String validatorText;

  final Widget icon;
  final bool obscureText;
  const NewPasswordTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.icon,
    required this.obscureText,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF667085)),
        // hintText: labelText,
        //  hintStyle: TextStyle(color: Color(0xFF667085)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return validatorText;
        }

        return null;
      },
    );
  }
}
