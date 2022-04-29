import 'package:flutter/material.dart';

class StudentInfoWidget extends StatelessWidget {
  const StudentInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: const [
          InfoWidget(
            title: 'Date:',
            title2: '29-4-2022',
            startIndent: 45,
            endIndent: 190,
          ),
          SizedBox(
            height: 10,
          ),
          InfoWidget(
            title: 'Class Strength:',
            title2: '20',
            startIndent: 120,
            endIndent: 150,
          ),
          SizedBox(
            height: 10,
          ),
          InfoWidget(
            title: 'No. of working days:',
            title2: '180',
            startIndent: 160,
            endIndent: 110,
          ),
          SizedBox(
            height: 10,
          ),
          InfoWidget(
            title: 'No. of present days:',
            title2: '80',
            startIndent: 160,
            endIndent: 110,
          ),
        ],
      ),
    );
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
