import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paralelosemana2/widgets/c_text_field.dart';

class CFloatingActionButton1 extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData buttonIcon;

  CFloatingActionButton1({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  CFloatingActionButton1State createState() => CFloatingActionButton1State();
}

class CFloatingActionButton1State extends State<CFloatingActionButton1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                widget.buttonIcon,
                size: 28.0,
              ),
            ),
            Expanded(
              child: Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MiscButtons extends StatefulWidget {
  final VoidCallback onPressedGenerarArreglo;
  final VoidCallback onPressedCorrerAlgoritmos;
  final TextEditingController nAmount;
  final TextEditingController minAmount;
  final TextEditingController maxAmount;

  MiscButtons({
    Key? key,
    required this.onPressedGenerarArreglo,
    required this.onPressedCorrerAlgoritmos,
    required this.nAmount,
    required this.minAmount,
    required this.maxAmount,
  }) : super(key: key);

  @override
  MiscButtonsState createState() => MiscButtonsState();
}

class MiscButtonsState extends State<MiscButtons> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> cWidgets = [
      const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Arreglo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.black),
        ],
      ),
      CTextFieldInput(
        textFieldLabel: "Cantidad",
        textController: widget.nAmount,
      ),
      CTextFieldInput(
        textFieldLabel: "Valor Mínimo",
        textController: widget.minAmount,
      ),
      CTextFieldInput(
        textFieldLabel: "Valor Máximo",
        textController: widget.maxAmount,
      ),
      CFloatingActionButton1(
        buttonText: "Generar Arreglo",
        onPressed: widget.onPressedGenerarArreglo,
        buttonIcon: Icons.onetwothree,
      ),
      const Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Text(
              "Ejecutar",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
          ],
        ),
      ),
      CFloatingActionButton1(
        buttonText: "Correr Algoritmos",
        onPressed: widget.onPressedCorrerAlgoritmos,
        buttonIcon: Icons.play_arrow_outlined,
      ),
    ];
    return Column(
      children: cWidgets.map((button) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: button,
        );
      }).toList(),
    );
  }
}
