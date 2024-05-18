import 'package:flutter/material.dart';

class TextInputWidgetMobile extends StatelessWidget {
  String labelText;
  String hintText;
  TextEditingController controller;
  TextInputWidgetMobile(
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

class MyTextMobile extends StatelessWidget {
  const MyTextMobile({
    required this.fieldName,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    this.textDirection,
    this.textAlign,
  });

  final double fontSize;
  final String fieldName;
  final Color color;
  final FontWeight fontWeight;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: textAlign,
        textDirection: textDirection,
        fieldName,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
