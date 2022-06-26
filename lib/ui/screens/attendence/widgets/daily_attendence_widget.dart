import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class DailyAttendenceWidget extends StatefulWidget {
  final Function(String month) callBack;
  final List<String> months;
  final List<Map<String, dynamic>> days;
  const DailyAttendenceWidget(
      {Key? key,
      required this.callBack,
      required this.months,
      required this.days})
      : super(key: key);

  @override
  State<DailyAttendenceWidget> createState() => _DailyAttendenceWidgetState();
}

class _DailyAttendenceWidgetState extends State<DailyAttendenceWidget> {
  late String selectedMonth;

  @override
  void initState() {
    super.initState();
    selectedMonth = widget.months[DateTime.now().month - 1];
  }

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
            Row(
              children: [
                const Text(
                  'Month :',
                  style: headingTextStyle,
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  // Initial Value
                  value: selectedMonth,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: widget.months.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                    widget.callBack(newValue!);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Total Presents :',
                  style: headingTextStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.days
                      .where((element) => element['is_present'])
                      .toList()
                      .length
                      .toString(),
                  style: subHeadingTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Total Absents :',
                  style: headingTextStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.days
                      .where((element) => !element['is_present'])
                      .toList()
                      .length
                      .toString(),
                  style: subHeadingTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Leaves :',
                  style: headingTextStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.days
                      .where((element) => element['on_leave'])
                      .toList()
                      .length
                      .toString(),
                  style: subHeadingTextStyle,
                ),
              ],
            ),
          ],
        ));
  }
}
