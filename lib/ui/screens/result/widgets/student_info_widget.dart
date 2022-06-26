import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentInfoWidget extends StatelessWidget {
  final Map student;
  const StudentInfoWidget({Key? key, required this.student}) : super(key: key);

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
            return const SizedBox();
          }

          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Column(
                    children: [
                      InfoWidget(
                        title: 'Result Date:',
                        title2: '${data['result_date']}',
                        startIndent: 0,
                        endIndent: 210,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InfoWidget(
                        title: 'Class Strength:',
                        title2: '${data['class_strength']}:',
                        startIndent: 120,
                        endIndent: 150,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InfoWidget(
                        title: 'No. of working days:',
                        title2: '${data['work_days']}:',
                        startIndent: 160,
                        endIndent: 110,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InfoWidget(
                        title: 'No. of present days:',
                        title2: '${data['present_days']}:',
                        startIndent: 160,
                        endIndent: 110,
                      ),
                    ],
                  );
                }).toList(),
              ));
        });
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.title,
    required this.title2,
    required this.startIndent,
    required this.endIndent,
  }) : super(key: key);
  final String title;
  final String title2;
  final double startIndent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Text(title2),
          ],
        ),
        Divider(
          thickness: 2,
          indent: startIndent,
          endIndent: endIndent,
        ),
      ],
    );
  }
}
