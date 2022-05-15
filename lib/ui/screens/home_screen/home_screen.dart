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
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePage();
}

class _HomePage extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    rightDrawer() {
      return Drawer(
        backgroundColor: Colors.blueAccent,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SafeArea(
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "LogOut",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => signOut(),
              ),
            ),
          ],
        ),
      );
    }

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('home_screen')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }

          return Scaffold(
              endDrawer: rightDrawer(),
              appBar: AppBarWidget(
                title: const Text('Menu'),
                backgroundColor: appBarColor,
                backButtonCallback: () => Navigator.pop(context),
              ),
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: bGColor,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(children: [
                              Text(
                                'Hi ${data['name']}',
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
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Be a Life Time Learner',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                  Image.asset(
                                    AppAssets.school,
                                    width: 100,
                                    height: 100,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ImageContainerWidget(
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Diary()));
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
                                              builder: (context) =>
                                                  const ResultScreen()));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ImageContainerWidget(
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TimeTable()));
                                    },
                                    image: AppAssets.timeTable,
                                    title: 'Time Table',
                                  ),
                                  ImageContainerWidget(
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Application()));
                                    },
                                    image: AppAssets.application,
                                    title: 'Application',
                                  ),
                                  ImageContainerWidget(
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EventCalendar()));
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
                                          builder: (context) =>
                                              const TestReport()));
                                },
                                image: AppAssets.testReport,
                                title: 'Monthly Test\nReport',
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ));
        });
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut().then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false));
  }
}
