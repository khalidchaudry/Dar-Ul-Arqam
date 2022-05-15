import 'package:darularqam/configs/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens.dart';
import 'widgets/widgets.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = AppRoutes.splash;
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const StudentInfo()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffECF0F7), Color(0xff6A88C4)],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LogoWidget(),
            SizedBox(
              height: 20,
            ),
            AppNameWidget()
          ],
        ),
      ),
    );
  }
}
