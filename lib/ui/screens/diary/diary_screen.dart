import 'package:darularqam/constants/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _Diary();
}

@override
class _Diary extends State<Diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Home Diary'),
        backgroundColor: const Color(0xFF191581),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: bGColor,
        )),
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                ContainerWidget(),
                SizedBox(
                  height: 20,
                ),
                SubjectWidget()
              ],
            )),
      ),
    );
  }
}
