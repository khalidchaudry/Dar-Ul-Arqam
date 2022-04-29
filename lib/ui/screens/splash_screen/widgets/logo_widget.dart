import 'package:flutter/material.dart';

import '../../../../configs/configs.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(AppAssets.logo),
    );
  }
}
