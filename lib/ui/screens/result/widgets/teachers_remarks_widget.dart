import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class TeachersRemarksWidget extends StatelessWidget {
  const TeachersRemarksWidget({Key? key, required this.student})
      : super(key: key);
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

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Row(
                children: [
                  const TextWidget(
                      title: "Teacher's remarks:",
                      bgColor: Colors.white,
                      textColor: Colors.black),
                  const SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                      title: " ${data['teacher_remarks']}",
                      bgColor: Colors.purple,
                      textColor: Colors.white),
                ],
              );
            }).toList(),
          );
        });
  }
}
