import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewPhoneNumberTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final String validatorText;

  const NewPhoneNumberTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
      mask: '+88# ####-######',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return TextFormField(
      inputFormatters: [maskFormatter],
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF667085)),
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
        if (value == null || value.isEmpty) {
          return validatorText;
        }

        // Check if the input starts with '+880'
        if (!value.startsWith('+880')) {
          return 'Phone number should start with +880';
        }

        return null;
      },
    );
  }
}
