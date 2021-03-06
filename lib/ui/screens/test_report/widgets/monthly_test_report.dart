import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class MonthlyTestReport extends StatelessWidget {
  const MonthlyTestReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('monthly_report')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: Table(border: TableBorder.all(), children: [
                    const TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Text(
                            'No#',
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
                          data['date'],
                          style: headingTextStyle,
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: Text(
                            data['subject'],
                            style: headingTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['total_marks'],
                          style: headingTextStyle,
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['obtain_marks'],
                          style: headingTextStyle,
                        ),
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
                            data['subject2'],
                            style: headingTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['total_marks2'],
                          style: headingTextStyle,
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['obtain_marks2'],
                          style: headingTextStyle,
                        ),
                      )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Text(
                          data['date3'],
                          style: headingTextStyle,
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: Text(
                            data['subject3'],
                            style: headingTextStyle,
                          ),
                        ),
                      ),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['total_marks3'],
                          style: headingTextStyle,
                        ),
                      )),
                      TableCell(
                          child: Center(
                        child: Text(
                          data['obtain_marks3'],
                          style: headingTextStyle,
                        ),
                      )),
                    ]),
                  ]));
            }).toList(),
          );
        });
  }
}
