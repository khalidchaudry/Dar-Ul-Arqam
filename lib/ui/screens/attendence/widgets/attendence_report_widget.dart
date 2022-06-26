import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendenceReportWidget extends StatelessWidget {
  const AttendenceReportWidget({Key? key, required this.days})
      : super(key: key);

  final List<Map<String, dynamic>> days;

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance
    //         .collection('ayesha')
    //         .doc(FirebaseAuth.instance.currentUser!.uid)
    //         .collection('attendence')
    //         .snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Center(child: Text('Something went wrong'));
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const CircularProgressIndicator.adaptive();
    //       }

    //       r
    //     });

    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              children: [
                const TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Date',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        ),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Day',
                        textAlign: TextAlign.center,
                        style: headingTextStyle,
                      ),
                    ),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Present/Absent',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        ),
                      )),
                ]),
                ...days.map(
                  (data) {
                    var timestamp = data['date'];
                    return TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // Timestamp.fromDate(
                            //         (data['date'] as Timestamp).toDate())
                            //     .toString(),
                            timestamp.toString(),
                            style: headingTextStyle,
                          ),
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['day'],
                              style: headingTextStyle,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data['is_present'] ? 'Present' : 'Absent',
                            style: headingTextStyle,
                          ),
                        ),
                      )),
                    ]);
                  },
                ).toList(),
              ],
            ),
          )),
    );
  }
}
