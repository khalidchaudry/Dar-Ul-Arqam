import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'widgets/widgets.dart';

class TestReport extends StatefulWidget {
  const TestReport({Key? key}) : super(key: key);

  @override
  State<TestReport> createState() => _TestReport();
}

@override
class _TestReport extends State<TestReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Test Report'),
          backgroundColor: const Color(0xFF191581),
        ),
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: bGColor)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TestReportWidget(),
                SizedBox(
                  height: 20,
                ),
                MonthlyTestReport(),
                RemarksWidget()
              ],
            )));
  }
}
