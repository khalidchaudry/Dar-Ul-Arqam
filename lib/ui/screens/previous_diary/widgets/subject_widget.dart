import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ayesha')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('diary')
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
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Subjects',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text('Class: '),
                      RoundedContainerWidget(title: data['class']),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'English',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(data['english2'],
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'Urdu',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(data['urdu2'],
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'Mathematics',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(data['math2'],
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'Islamiat',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Unit # 2 MCQS',
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'Science',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(data['science'],
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RoundedContainerWidget(
                    title: 'Computer',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Unit # 2 Short Questions',
                      style: Theme.of(context).textTheme.bodyText2),
                  const Divider(),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
