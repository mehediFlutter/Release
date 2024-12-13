import 'package:flutter/material.dart';

class NewNameTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final TextInputType keyboardType;
  final String validatorText;

  const NewNameTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF667085)),
        //  hintText: labelText,
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
