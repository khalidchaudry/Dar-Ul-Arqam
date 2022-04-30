import 'package:darularqam/constants/constants.dart';
import 'package:flutter/gestures.dart';
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
                    child: Center(
                        child: Text(
                      'Log in',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text.rich(TextSpan(
                        text: 'Already have not an account?',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text: ' Sign Up',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen())),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white))
                        ])),
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
