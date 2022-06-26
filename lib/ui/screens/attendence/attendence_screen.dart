import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/configs/app_routes.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:darularqam/ui/widgets/appbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class AttendenceScreen extends StatefulWidget {
  static const routeName = AppRoutes.attendence;
  final Map student;
  const AttendenceScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  bool _loading = false;

  FirebaseFirestore cloud_firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> days = [];

  List<String> months = [
    'January',
    'January',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    _getAttendance(months[DateTime.now().month - 1]);
  }

  _getAttendance(String month) async {
    setState(() {
      _loading = true;
      days = [];
    });
    QuerySnapshot querySnapshot = await cloud_firestore
        .collection('parents')
        .doc(_auth.currentUser!.uid)
        .collection('childs')
        .doc(widget.student['s_id'])
        .collection('attendance')
        .where('month_name', isEqualTo: month)
        .get();

    List<QueryDocumentSnapshot> _list = querySnapshot.docs;
    if (_list.isNotEmpty) {
      for (var element in _list) {
        days.add(element.data() as Map<String, dynamic>);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: const Text('Attendance'),
        backgroundColor: appBarColor,
        backButtonCallback: () => Navigator.pop(context),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: bGColor)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          DailyAttendenceWidget(
            days: days,
            months: months,
            callBack: (String month) {
              _getAttendance(month);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AttendenceReportWidget(
            days: days,
          )
        ]),
      ),
    );
  }
}
