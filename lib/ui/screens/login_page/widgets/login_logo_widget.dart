import 'package:flutter/material.dart';

import '../../../../configs/configs.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
        backgroundColor: Color(0xffECF0F7),
        radius: 70,
        backgroundImage: AssetImage(AppAssets.logo));
  }
}
