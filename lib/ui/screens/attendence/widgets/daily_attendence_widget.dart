import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class DailyAttendenceWidget extends StatelessWidget {
  const DailyAttendenceWidget({
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
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        'Daily Attendence',
                        style: headingTextStyle,
                      ),
                      const Divider(
                        thickness: 2,
                        endIndent: 180,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Month :',
                            style: headingTextStyle,
                          ),
                          Text(
                            data['month'],
                            style: subHeadingTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total Presents :',
                            style: headingTextStyle,
                          ),
                          Text(
                            data['total_presents'],
                            style: subHeadingTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Total Absents :',
                            style: headingTextStyle,
                          ),
                          Text(
                            data['total_absents'],
                            style: subHeadingTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Leaves :',
                            style: headingTextStyle,
                          ),
                          Text(
                            data['leaves'],
                            style: subHeadingTextStyle,
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
              ));
        });
  }
}
