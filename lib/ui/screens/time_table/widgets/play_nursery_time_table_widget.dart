import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlayToNurseryTimeTableWidget extends StatelessWidget {
  const PlayToNurseryTimeTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('time_table')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Play-Nursery',
                          style: headingTextStyle,
                        ),
                        const Divider(
                          thickness: 2,
                          endIndent: 220,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            const TableRow(children: [
                              TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Text(
                                    'Assembly',
                                    textAlign: TextAlign.center,
                                    style: headingTextStyle,
                                  )),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Text(
                                  'Break',
                                  textAlign: TextAlign.center,
                                  style: headingTextStyle,
                                ),
                              ),
                              TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
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
                                  data['asb_nursery'],
                                  style: headingTextStyle,
                                ),
                              )),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    data['break_nursery'],
                                    style: headingTextStyle,
                                  ),
                                ),
                              ),
                              TableCell(
                                  child: Center(
                                child: Text(
                                  data['leave_nursery'],
                                  style: headingTextStyle,
                                ),
                              )),
                            ]),
                          ],
                        )
                      ]);
                }).toList(),
              ));
        });
  }
}
