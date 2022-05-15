import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class TeachersRemarksWidget extends StatelessWidget {
  const TeachersRemarksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('result')
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
