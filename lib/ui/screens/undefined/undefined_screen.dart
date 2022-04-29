import 'package:flutter/material.dart';

class UndefinedScreen extends StatelessWidget {
  final String routeName;

  const UndefinedScreen({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UndefinedScreen::$routeName'),
      ),
    );
  }
}
