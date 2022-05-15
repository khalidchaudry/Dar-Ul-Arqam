import 'package:darularqam/ui/screens/pre_test_report/pre_test_report_screen.dart';
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
              children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PreTestReport()));
                        },
                        child: const Text(
                          'Previous Monthly Report',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                const TestReportWidget(),
                const SizedBox(
                  height: 20,
                ),
                const MonthlyTestReport(),
                const RemarksWidget()
              ],
            )));
  }
}
