import 'package:darularqam/constants/constants.dart';
import 'package:flutter/material.dart';

class PrepToMetricTimeTableWidget extends StatelessWidget {
  const PrepToMetricTimeTableWidget({
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Prep-10th',
                style: headingTextStyle,
              ),
              const Divider(
                thickness: 2,
                endIndent: 235,
              ),
              const SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'Assembly',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        )),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Text(
                        'Break',
                        textAlign: TextAlign.center,
                        style: headingTextStyle,
                      ),
                    ),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'Leave',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        )),
                  ]),
                  TableRow(children: [
                    TableCell(
                        child: Center(
                      child: Text(
                        '7:40',
                        style: headingTextStyle,
                      ),
                    )),
                    TableCell(
                      child: Center(
                        child: Text(
                          '10:40',
                          style: headingTextStyle,
                        ),
                      ),
                    ),
                    TableCell(
                        child: Center(
                      child: Text(
                        '12:10',
                        style: headingTextStyle,
                      ),
                    )),
                  ]),
                ],
              ),
            ],
          )),
    );
  }
}
