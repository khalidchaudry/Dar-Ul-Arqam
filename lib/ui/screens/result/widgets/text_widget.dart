import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.textColor})
      : super(key: key);
  final String title;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          backgroundColor: bgColor,
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
    );
  }
}
