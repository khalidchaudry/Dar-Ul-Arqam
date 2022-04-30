import 'package:flutter/material.dart';

import '../../../configs/configs.dart';
import '../../../constants/constants.dart';
import '../../widgets/widgets.dart';
import 'widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = AppRoutes.register;
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          actions: const [],
          backButtonCallback: () => Navigator.pop(context),
          backgroundColor: appBarColor,
          title: Text('Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: bGColor)),
          child: const BodyWidget(),
        ));
  }
}
