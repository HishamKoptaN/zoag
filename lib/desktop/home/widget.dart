import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  String labelText;
  String hintText;
  TextEditingController controller;
  TextInputWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 50,
      child: TextField(
        textDirection: TextDirection.rtl,
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    required this.fieldName,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    this.textDirection,
  });

  final double fontSize;
  final String fieldName;
  final Color color;
  final FontWeight fontWeight;
  final TextDirection? textDirection;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textDirection: textDirection,
        fieldName,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
