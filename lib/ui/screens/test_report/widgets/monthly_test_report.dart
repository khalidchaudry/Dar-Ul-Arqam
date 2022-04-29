import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class MonthlyTestReport extends StatelessWidget {
  const MonthlyTestReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Table(border: TableBorder.all(), children: const [
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
                  'Subject',
                  textAlign: TextAlign.center,
                  style: headingTextStyle,
                ),
              ),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Total Marks',
                    textAlign: TextAlign.center,
                    style: headingTextStyle,
                  )),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Obtain Marks',
                    textAlign: TextAlign.center,
                    style: headingTextStyle,
                  )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  '01',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                child: Center(
                  child: Text(
                    'Math',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '90',
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
                    'Pak Study',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '76',
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
                    'Science',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '70',
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
                    'General Knowledge',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '80',
                  style: headingTextStyle,
                ),
              )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  '16',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                child: Center(
                  child: Text(
                    'History',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '86',
                  style: headingTextStyle,
                ),
              )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  '29',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                child: Center(
                  child: Text(
                    'General Science',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '78',
                  style: headingTextStyle,
                ),
              )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  '18',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                child: Center(
                  child: Text(
                    'English B',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '89',
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
                    'Drawing',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '90',
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
                    'English',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '60',
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
                    'Urdu',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '67',
                  style: headingTextStyle,
                ),
              )),
            ]),
            TableRow(children: [
              TableCell(
                  child: Center(
                child: Text(
                  '10',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                child: Center(
                  child: Text(
                    'Islamic Studies',
                    style: headingTextStyle,
                  ),
                ),
              ),
              TableCell(
                  child: Center(
                child: Text(
                  '100',
                  style: headingTextStyle,
                ),
              )),
              TableCell(
                  child: Center(
                child: Text(
                  '70',
                  style: headingTextStyle,
                ),
              )),
            ]),
          ])),
    );
  }
}
