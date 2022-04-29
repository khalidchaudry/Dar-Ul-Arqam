import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _Application();
}

@override
class _Application extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(onPressed: () {}, child: const Text('Submit')),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Application'),
          backgroundColor: const Color(0xFF191581),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: bGColor)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: const TextField(
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                  hintText: 'Write your application here...',
                  border: InputBorder.none),
            ),
          ),
        ));
  }
}
