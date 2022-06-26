import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:darularqam/ui/screens/home_screen/home_screen.dart';
import 'package:darularqam/ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../configs/configs.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentInfo> createState() => _StudentInfo();
}

class _StudentInfo extends State<StudentInfo> {
  List<Map<String, dynamic>> child = [];
  bool _isloading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _getChilds();
  }

  _getChilds() async {
    try {
      setState(() {
        _isloading = true;
      });
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('parents')
          .doc(_auth.currentUser!.uid)
          .collection('childs')
          .get();
      List<QueryDocumentSnapshot> _list = querySnapshot.docs;
      if (_list.isNotEmpty) {
        for (var element in _list) {
          child.add(element.data() as Map<String, dynamic>);
        }
      }
      setState(() {
        _isloading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: Text('Dar-e-Arqam School'),
          backgroundColor: appBarColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: bGColor,
          )),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: child
                    .map(
                      (data) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              // BoxShadow(
                              //   offset: const Offset(0, 10),
                              //   blurRadius: 20,
                              //   color: Colors.white.withOpacity(.5),
                              // ),
                            ]),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: Image.asset(
                            //     AppAssets.user,
                            //     height: 60,
                            //   ),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   height: 40,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(20),
                            //       color: const Color(0xffF9F926)),
                            //   child: const Text(
                            //     'Student Information',
                            //     style: TextStyle(
                            //         fontSize: 15, fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(data['s_name']),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'RollNo#',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(data['roll_no']),
                              ],
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Class',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(data['class']),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xffF9F926)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                  student: data,
                                                )));
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
        ));
  }
}
