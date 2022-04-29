import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class RemarksWidget extends StatelessWidget {
  const RemarksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: const [
              Text(
                'Remarks',
                style: headingTextStyle,
              ),
              Text(
                ': 316/400',
                style: headingTextStyle,
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            endIndent: 240,
          ),
        ]));
  }
}
