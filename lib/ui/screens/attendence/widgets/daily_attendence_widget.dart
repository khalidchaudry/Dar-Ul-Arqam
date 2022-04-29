import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class DailyAttendenceWidget extends StatelessWidget {
  const DailyAttendenceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Daily Attendence',
            style: headingTextStyle,
          ),
          const Divider(
            thickness: 2,
            endIndent: 180,
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
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text(
                'Total Presents :',
                style: headingTextStyle,
              ),
              Text(
                ' 20',
                style: subHeadingTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text(
                'Total Absents :',
                style: headingTextStyle,
              ),
              Text(
                ' 4',
                style: subHeadingTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text(
                'Leaves :',
                style: headingTextStyle,
              ),
              Text(
                ' 2',
                style: subHeadingTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
