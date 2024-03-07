import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleImagePage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final RxBool _showError = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => TextField(
                  controller: _textFieldController,
                  decoration: InputDecoration(
                    labelText: 'Enter a value',
                    errorText: _showError.value ? 'Please enter a value' : null,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _showError.value
                              ? Get.theme.errorColor
                              : Colors.transparent),
                    ),
                  ),
                )),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_textFieldController.text.isEmpty) {
                  _showError.value = true;
                } else {
                  _showError.value = false;
                  // Perform submit action
                  Get.snackbar('Success', 'Value submitted');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  final TextEditingController textController;
  final bool isValid;
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
        errorText: isValid ? null : 'Invalid text',
      ),
    );
  }
}
