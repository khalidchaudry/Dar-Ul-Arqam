import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _Application();
}

@override
class _Application extends State<Application> {
  final applicationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: TextField(
                    maxLines: 200,
                    controller: applicationController,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                        hintText: 'Write your application here...',
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                  color: Colors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc('ZoNy1M4xdpVGzMqI2ScQDR2QnqO2')
                        .collection('application')
                        .add({'application': applicationController});
                  },
                  child: const Text('Submit')),
            ],
          ),
        ));
  }
}
