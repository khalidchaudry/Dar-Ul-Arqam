import 'package:darularqam/constants/constants.dart';
import 'package:flutter/material.dart';

class ResultSheetWidget extends StatelessWidget {
  const ResultSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              DataTable(
                headingRowColor:
                    MaterialStateProperty.all(const Color(0xff1E90FF)),
                columns: const [
                  DataColumn(
                      label: Text(
                    'Subject',
                    style: resultTitleColor,
                  )),
                  DataColumn(
                      label: Text(
                    'Max.\nMarks',
                    style: resultTitleColor,
                  )),
                  DataColumn(
                      label: Text(
                    'Obt.\nMarks',
                    style: resultTitleColor,
                  )),
                  DataColumn(
                      label: Text(
                    '%Age',
                    style: resultTitleColor,
                  )),
                  DataColumn(
                      label: Text(
                    'Grade',
                    style: resultTitleColor,
                  )),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('1  Al Quran')),
                    DataCell(Text('75')),
                    DataCell(Text('73')),
                    DataCell(Text('97%')),
                    DataCell(Text('A+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2  English')),
                    DataCell(Text('100')),
                    DataCell(Text('95')),
                    DataCell(Text('95%')),
                    DataCell(Text('A+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3  Urdu')),
                    DataCell(Text('100')),
                    DataCell(Text('80')),
                    DataCell(Text('80%')),
                    DataCell(Text('B+')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('4  Science')),
                    DataCell(Text('100')),
                    DataCell(Text('70')),
                    DataCell(Text('70%')),
                    DataCell(Text('B')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('5  G.K')),
                    DataCell(Text('100')),
                    DataCell(Text('90')),
                    DataCell(Text('90%')),
                    DataCell(Text('A')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'Grand Total',
                      style: TextStyle(
                          backgroundColor: Colors.green,
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    )),
                    DataCell(Text('475')),
                    DataCell(Text('408')),
                    DataCell(Text('86%')),
                    DataCell(Text('A')),
                  ]),
                ],
              ),
            ],
          ),
        ));
  }
}
