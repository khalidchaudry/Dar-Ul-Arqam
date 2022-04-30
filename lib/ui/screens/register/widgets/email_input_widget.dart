import 'package:flutter/material.dart';

import '../../../widgets/text_input_widget.dart';

class EmailInputWidget extends StatelessWidget {
  const EmailInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid Email';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      hintText: 'Email Address',
      prefixIcon: Icons.email,
      onChanged: (String value) {},
    );
  }
}
