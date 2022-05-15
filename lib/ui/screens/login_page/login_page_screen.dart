import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  bool _isLoading = false;
  bool isLoginSuccess = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  _login() async {
    try {
      setState(() {
        _isLoading = true;
      });
      debugPrint(emailTextController.text);
      await _auth.signInWithEmailAndPassword(
          email: emailTextController.text.trim(),
          password: passwordTextController.text.trim());
      setState(() {
        _isLoading = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const StudentInfo()));
    } catch (e) {
      setState(() {
        _isLoading = false;
        isLoginSuccess = false;
      });
      final snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    controller: emailTextController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 14),
                          child: Icon(Icons.email)),
                      prefixIconConstraints:
                          const BoxConstraints(maxHeight: 48, maxWidth: 48),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Email',
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
                    controller: passwordTextController,
                    onChanged: (String value) {},
                    textInputAction: TextInputAction.done,
                    obscureText: _isObsecure,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Password',
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20, right: 14),
                            child: Icon(
                              Icons.lock,
                            )),
                        prefixIconConstraints:
                            const BoxConstraints(maxHeight: 48, maxWidth: 48),
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
                    height: 50,
                    shape: const StadiumBorder(),
                    color: Colors.yellow,
                    onPressed: _isLoading
                        ? null
                        : () {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            });
                          },
                    child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                'Log in',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black),
                              )),
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
