import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 49,
            ),
            const FirstNameInputWidget(),
            const SizedBox(
              height: 15,
            ),
            const LastNameInputWidget(),
            const SizedBox(
              height: 15,
            ),
            const EmailInputWidget(),
            const SizedBox(
              height: 15,
            ),
            const PasswordInputWidget(),
            const SizedBox(
              height: 15,
            ),
            const ConfirmPasswordInputWidget(),
            const SizedBox(
              height: 30,
            ),
            RegisterButtonWidget(
              press: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text.rich(TextSpan(
                  text: 'Already have an account?',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                        text: '  Log in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pop(context),
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
