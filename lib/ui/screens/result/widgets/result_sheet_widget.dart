import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResultSheetWidget extends StatelessWidget {
  const ResultSheetWidget({Key? key, required this.student}) : super(key: key);

  final Map student;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('parents')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('childs')
            .doc(student['s_id'])
            .collection('result')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }

          return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Column(
                        children: [
                          DataTable(
                            headingRowColor: MaterialStateProperty.all(
                                const Color(0xff1E90FF)),
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
                            rows: [
                              DataRow(cells: [
                                DataCell(Text('1  ${data['subject']}')),
                                DataCell(Text(data['max_marks'])),
                                DataCell(Text(data['obt_marks'])),
                                DataCell(Text(data['percentage'])),
                                DataCell(Text(data['grade'])),
                              ]),
                              DataRow(cells: [
                                DataCell(Text('2  ${data['subject2']}')),
                                DataCell(Text(data['max_marks2'])),
                                DataCell(Text(data['obt_marks2'])),
                                DataCell(Text(data['percentage2'])),
                                DataCell(Text(data['grade2'])),
                              ]),
                              DataRow(cells: [
                                const DataCell(Text(
                                  'Grand Total',
                                  style: TextStyle(
                                      backgroundColor: Colors.green,
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )),
                                DataCell(Text(data['total_marks'])),
                                DataCell(Text(data['total_obt_marks'])),
                                DataCell(Text(data['total_percent'])),
                                DataCell(Text(data['final_grade'])),
                              ]),
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                  )));
        });
  }
}
