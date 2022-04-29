import 'package:flutter/material.dart';

import '../../../../configs/configs.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.appName,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
