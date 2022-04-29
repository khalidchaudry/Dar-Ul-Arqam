import 'package:flutter/material.dart';

import 'widgets.dart';

class TeachersRemarksWidget extends StatelessWidget {
  const TeachersRemarksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TextWidget(
            title: "Teacher's remarks:",
            bgColor: Colors.white,
            textColor: Colors.black),
        SizedBox(
          width: 10,
        ),
        TextWidget(
            title: " Outstanding",
            bgColor: Colors.purple,
            textColor: Colors.white),
      ],
    );
  }
}
