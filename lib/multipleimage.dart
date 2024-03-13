import 'package:flutter/material.dart';

class MultipleImagePage extends StatefulWidget {
  @override
  _MultipleImagePageState createState() => _MultipleImagePageState();
}

class _MultipleImagePageState extends State<MultipleImagePage> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    // Fetch the text value from the backend and set it to the controller
    _textEditingController.text = "Text value from backend";
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Image Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            labelText: 'Text Value',
          ),
        ),
      ),
    );
  }
}
