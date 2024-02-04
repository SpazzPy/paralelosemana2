// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';

class CTextFieldInput extends StatefulWidget {
  TextEditingController textController;
  final String textFieldLabel;

  CTextFieldInput({
    Key? key,
    required this.textController,
    required this.textFieldLabel,
  }) : super(key: key);

  @override
  CTextFieldInputState createState() => CTextFieldInputState();
}

class CTextFieldInputState extends State<CTextFieldInput> {
  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
          controller: widget.textController,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: widget.textFieldLabel,
          )),
    );
  }
}

class CTextFieldOutput extends StatefulWidget {
  String content;

  CTextFieldOutput({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  CTextFieldOutputState createState() => CTextFieldOutputState();
}

class CTextFieldOutputState extends State<CTextFieldOutput> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    textController.text = widget.content;
    return SingleChildScrollView(
      child: TextField(
        controller: textController,
        maxLines: null,
        decoration: null,
        readOnly: true,
      ),
    );
  }
}
