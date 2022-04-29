import 'package:darularqam/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../screens.dart';
import 'widgets/login_logo_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppRoutes.login;
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginPage();
}

class _LoginPage extends State<LoginScreen> {
  bool _isObsecure = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: bGColor)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login to your Portal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Username',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: _isObsecure,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(_isObsecure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObsecure = !_isObsecure;
                            });
                          },
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: const Color(0xffF9F926),
                    minWidth: 200,
                    height: 50,
                    shape: const StadiumBorder(),
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StudentInfo()));
                        }
                      });
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
