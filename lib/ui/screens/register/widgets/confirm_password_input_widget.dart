import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ConfirmPasswordInputWidget extends StatelessWidget {
  const ConfirmPasswordInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid passcode';
        }
        return null;
      },
      hintText: 'Confirm Password',
      textInputAction: TextInputAction.done,
      prefixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
      prefixIcon: Icons.lock,
      obscureText: true,
      onChanged: (String value) {},
    );
  }
}
