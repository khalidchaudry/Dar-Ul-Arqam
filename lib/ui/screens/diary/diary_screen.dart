import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/widgets.dart';

class Diary extends StatefulWidget {
  final Map student;

  const Diary({Key? key, required this.student}) : super(key: key);

  @override
  State<Diary> createState() => _Diary();
}

@override
class _Diary extends State<Diary> {
  Map<String, dynamic> map = {};

  bool _loading = false;

  FirebaseFirestore cloud_firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> data = [];

  void initState() {
    super.initState();
    _onLoadDiary(DateFormat('dd/MM/yyyy').format(DateTime.now()));
  }

  void _onLoadDiary(String date) async {
    try {
      setState(() {
        _loading = true;
        data = [];
      });

      QuerySnapshot querySnapshot = await cloud_firestore
          .collection('parents')
          .doc(_auth.currentUser!.uid)
          .collection('childs')
          .doc(widget.student['s_id'])
          .collection('diary')
          .where('date', isEqualTo: date)
          .get();

      List<QueryDocumentSnapshot> _list = querySnapshot.docs;
      if (_list.isNotEmpty) {
        for (var element in _list) {
          data.add(element.data() as Map<String, dynamic>);
        }
      }
      setState(() {
        _loading = false;
      });
    } catch (e) {}
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              // Container(
              //     width: double.infinity,
              //     padding: const EdgeInsets.all(5),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(5)),
              //     child: TextButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const PreviousDiary()));
              //         },
              //         child: const Text(
              //           'Previous Diary',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 18),
              //         ))),
              const SizedBox(
                height: 0,
              ),
              ContainerWidget(
                onPressed: (String date) {
                  _onLoadDiary(date);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if (_loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (!_loading)
                if (data.isNotEmpty)
                  SubjectWidget(
                    data: data[0],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
