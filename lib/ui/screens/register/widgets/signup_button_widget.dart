import 'package:flutter/material.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    Key? key,
    required this.press,
  }) : super(key: key);
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      shape: const StadiumBorder(),
      color: Colors.yellow,
      onPressed: press,
      child: Center(
          child: Text(
        'Sign up',
        style: Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      )),
    );
  }
}
