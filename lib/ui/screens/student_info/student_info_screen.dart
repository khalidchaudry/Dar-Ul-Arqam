import 'package:darularqam/constants/constants.dart';
import 'package:darularqam/ui/screens/home_screen/home_screen.dart';
import 'package:darularqam/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({Key? key}) : super(key: key);
  @override
  State<StudentInfo> createState() => _StudentInfo();
}

@override
class _StudentInfo extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: Text('Dar-e-Arqam School'),
          backgroundColor: appBarColor,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: bGColor,
          )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                          color: Colors.white.withOpacity(.5),
                        ),
                      ]),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   'assets/student.jpeg',
                      //   // width: 100,
                      //   height: 254,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffF9F926)),
                        child: const Text(
                          'Student Information',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Name            Ayesha Matloob'),
                      const Divider(
                        thickness: 2,
                        indent: 70,
                        endIndent: 70,
                      ),
                      const Text('Roll#                                18301'),
                      const Divider(
                        thickness: 2,
                        indent: 70,
                        endIndent: 70,
                      ),
                      const Text('Class                                BSCS'),
                      const Divider(
                        thickness: 2,
                        indent: 70,
                        endIndent: 70,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffF9F926)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
