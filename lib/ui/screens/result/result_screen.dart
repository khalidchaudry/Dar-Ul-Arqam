import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'widgets/widgets.dart';

class ResultScreen extends StatelessWidget {
  final Map student;
  const ResultScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Result Screen'),
          backgroundColor: const Color(0xFF191581),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: bGColor,
            )),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StudentInfoWidget(
                      student: student,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ResultSheetWidget(
                      student: student,
                    ),
                    PercentContainerWidget(
                      student: student,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TeachersRemarksWidget(
                      student: student,
                    )
                  ]),
            )));
  }
}
