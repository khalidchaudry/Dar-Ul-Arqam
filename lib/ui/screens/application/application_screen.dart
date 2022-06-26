import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class Application extends StatefulWidget {
  final Map<String, dynamic> child;
  const Application({Key? key, required this.child}) : super(key: key);

  @override
  State<Application> createState() => _Application();
}

@override
class _Application extends State<Application> {
  bool _submitting = false;

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
                        contentPadding: EdgeInsets.all(20),
                        hintText: 'Write your application here...',
                        border: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_submitting) CircularProgressIndicator(),
              if (!_submitting)
                MaterialButton(
                    color: Colors.white,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () async {
                      try {
                        setState(() {
                          _submitting = true;
                        });
                        await FirebaseFirestore.instance
                            .collection('parents')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('childs')
                            .doc(widget.child['s_id'])
                            .collection('application')
                            .add({'application': applicationController.text});
                        setState(() {
                          _submitting = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Application submitted')));
                        applicationController.clear();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Something went wrong try again')));
                      }
                    },
                    child: const Text('Submit')),
            ],
          ),
        ));
  }
}
