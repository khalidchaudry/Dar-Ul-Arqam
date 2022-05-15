import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AttendenceReportWidget extends StatelessWidget {
  const AttendenceReportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('attendence')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }

          return Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Table(
                      border: TableBorder.all(),
                      children: [
                        const TableRow(children: [
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                'Date',
                                textAlign: TextAlign.center,
                                style: headingTextStyle,
                              )),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text(
                              'Day',
                              textAlign: TextAlign.center,
                              style: headingTextStyle,
                            ),
                          ),
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
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
                              data['date2'],
                              style: headingTextStyle,
                            ),
                          )),
                          TableCell(
                            child: Center(
                              child: Text(
                                data['day2'],
                                style: headingTextStyle,
                              ),
                            ),
                          ),
                          TableCell(
                              child: Center(
                            child: Text(
                              data['record2'],
                              style: headingTextStyle,
                            ),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Center(
                            child: Text(
                              data['date'],
                              style: headingTextStyle,
                            ),
                          )),
                          TableCell(
                            child: Center(
                              child: Text(
                                data['day'],
                                style: headingTextStyle,
                              ),
                            ),
                          ),
                          TableCell(
                              child: Center(
                            child: Text(
                              data['record'],
                              style: headingTextStyle,
                            ),
                          )),
                        ]),
                      ],
                    );
                  }).toList(),
                )),
          );
        });
  }
}
