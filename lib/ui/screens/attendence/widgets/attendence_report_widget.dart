import 'package:darularqam/constants/constants.dart';
import 'package:flutter/material.dart';

class AttendenceReportWidget extends StatelessWidget {
  const AttendenceReportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Table(
            border: TableBorder.all(),
            children: const [
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      'Date',
                      textAlign: TextAlign.center,
                      style: headingTextStyle,
                    )),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Day',
                    textAlign: TextAlign.center,
                    style: headingTextStyle,
                  ),
                ),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(
                      'Present/Absent',
                      textAlign: TextAlign.center,
                      style: headingTextStyle,
                    )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '20',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Monday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '21',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Tuesday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '22',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Wednesday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '23',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Thursday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '20',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Monday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '21',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Tuesday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '22',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Wednesday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '23',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Thursday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '19',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Monday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '20',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Tuesday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '15',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Saturday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'P',
                    style: headingTextStyle,
                  ),
                )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    '25',
                    style: headingTextStyle,
                  ),
                )),
                TableCell(
                  child: Center(
                    child: Text(
                      'Friday',
                      style: headingTextStyle,
                    ),
                  ),
                ),
                TableCell(
                    child: Center(
                  child: Text(
                    'A',
                    style: headingTextStyle,
                  ),
                )),
              ]),
            ],
          )),
    );
  }
}
