import 'package:darularqam/configs/app_assets.dart';
import 'package:darularqam/configs/app_routes.dart';
import 'package:darularqam/constants/constants.dart';

import 'package:flutter/material.dart';

import '../screens.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = AppRoutes.home;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: bGColor,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: const [
                Text(
                  'Hi Ayesha',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    AppAssets.user,
                  ),
                ),
              ]),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color(0xffF6F4F4),
                border: Border.all(),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Be a Life Time Learner',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w100)),
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
                                  builder: (context) => const Diary()));
                        },
                        image: AppAssets.diary,
                        title: 'Diary',
                      ),
                      ImageContainerWidget(
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const AttendenceScreen()))),
                        image: AppAssets.attendence,
                        title: 'Attendance',
                      ),
                      ImageContainerWidget(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResultScreen()));
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
                                  builder: (context) => const TimeTable()));
                        },
                        image: AppAssets.timeTable,
                        title: 'Time Table',
                      ),
                      ImageContainerWidget(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Application()));
                        },
                        image: AppAssets.application,
                        title: 'Application',
                      ),
                      ImageContainerWidget(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EventCalendar()));
                        },
                        image: AppAssets.calendar,
                        title: 'Event Calendar',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ImageContainerWidget(
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TestReport()));
                    },
                    image: AppAssets.testReport,
                    title: 'Monthly Test Report',
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
