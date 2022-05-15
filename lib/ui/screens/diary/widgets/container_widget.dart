import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Homework Diary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Divider(),
            const Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text('$date'),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
