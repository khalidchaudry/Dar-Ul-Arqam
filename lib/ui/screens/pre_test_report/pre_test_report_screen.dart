import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'widgets/widgets.dart';

class PreTestReport extends StatefulWidget {
  const PreTestReport({Key? key}) : super(key: key);

  @override
  State<PreTestReport> createState() => _TestReport();
}

@override
class _TestReport extends State<PreTestReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Previous Test Report'),
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
