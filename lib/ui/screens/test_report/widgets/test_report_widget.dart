import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class TestReportWidget extends StatelessWidget {
  const TestReportWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Test Report',
            style: headingTextStyle,
          ),
          const Divider(
            thickness: 2,
            endIndent: 220,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text(
                'Month :',
                style: headingTextStyle,
              ),
              Text(
                ' April',
                style: subHeadingTextStyle,
              ),
            ],
          ),
        ]));
  }
}
