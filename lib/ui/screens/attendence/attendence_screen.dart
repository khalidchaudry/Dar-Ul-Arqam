import 'package:darularqam/configs/app_routes.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:darularqam/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class AttendenceScreen extends StatefulWidget {
  static const routeName = AppRoutes.attendence;
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              DailyAttendenceWidget(),
              SizedBox(
                height: 20,
              ),
              AttendenceReportWidget()
            ]),
      ),
    );
  }
}
