import 'package:flutter/material.dart';

import 'widgets.dart';

class SubjectWidget extends StatelessWidget {
  const SubjectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            children: const [
              Text('Class: '),
              RoundedContainerWidget(title: 'Class Four'),
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
          Text('Unit # 5, Q#1-5', style: Theme.of(context).textTheme.bodyText2),
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
          Text('Test unit #3 short Questions',
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
          Text('Exercise # 4.1', style: Theme.of(context).textTheme.bodyText2),
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
          Text('Unit # 2 MCQS', style: Theme.of(context).textTheme.bodyText2),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const RoundedContainerWidget(
            title: 'Pak Studies',
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Revision', style: Theme.of(context).textTheme.bodyText2),
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
  }
}
