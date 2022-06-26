import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/configs/app_assets.dart';
import 'package:darularqam/configs/app_routes.dart';
import 'package:darularqam/constants/constants.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '../screens.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = AppRoutes.home;
  final Map<String, dynamic> student;
  const HomeScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen> {
  bool _isloading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance
    //         .collection('ayesha')
    //         .doc(FirebaseAuth.instance.currentUser!.uid)
    //         .collection('home_screen')
    //         .snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Center(child: Text('Something went wrong'));
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const CircularProgressIndicator.adaptive();
    //       }

    //     });
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: bGColor,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(children: [
                  Text(
                    widget.student['s_name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      AppAssets.user,
                    ),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text('Be a Life Time Learner',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400)),
                          Image.asset(
                            AppAssets.school,
                            width: 100,
                            height: 100,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Diary(
                                            student: widget.student,
                                          )));
                            },
                            image: AppAssets.diary,
                            title: 'Diary',
                          ),
                          ImageContainerWidget(
                            press: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AttendenceScreen(
                                          student: widget.student,
                                        )))),
                            image: AppAssets.attendence,
                            title: 'Attendance',
                          ),
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                            student: widget.student,
                                          )));
                            },
                            image: AppAssets.result,
                            title: 'Result',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimeTable(
                                            student: widget.student,
                                          )));
                            },
                            image: AppAssets.timeTable,
                            title: 'Time Table',
                          ),
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Application(
                                            child: widget.student,
                                          )));
                            },
                            image: AppAssets.application,
                            title: 'Application',
                          ),
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EventCalendar(
                                            child: widget.student,
                                          )));
                            },
                            image: AppAssets.calendar,
                            title: 'Event Calendar',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReportsScreen(
                                            student: widget.student,
                                          )));
                            },
                            image: AppAssets.testReport,
                            title: 'Monthly Test\nReport',
                          ),
                          ImageContainerWidget(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeeVoucherScree(
                                            student: widget.student,
                                          )));
                            },
                            image: AppAssets.feeVoucher,
                            title: 'Fee voucher',
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false));
  }
}
