import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController textController;
  final String isValid;
  final Function validateText;
  final String textName;
  const InputTextField(
      {super.key,
      required this.textController,
      required this.isValid,
      required this.validateText,
      required this.textName});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      onChanged: (value) {
        // controller.isValid.value = controller.validateText(value);
        validateText(value);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: textName,
        errorText: isValid == 'true' ? null : 'Invalid text',
      ),
    );
  }
}
