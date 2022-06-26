import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class SubjectWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const SubjectWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
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
              Text(data['English'],
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
              Text(data['Urdu'], style: Theme.of(context).textTheme.bodyText2),
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
              Text(data['Math'], style: Theme.of(context).textTheme.bodyText2),
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
              Text(data['Islamiate'],
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
              Text(data['Science'],
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
              Text(data['computer'],
                  style: Theme.of(context).textTheme.bodyText2),
              const Divider(),
              const RoundedContainerWidget(
                title: 'Social Studies',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(data['Social Studies'],
                  style: Theme.of(context).textTheme.bodyText2),
            ],
          ),
        ),
      ),
    );
  }
}
