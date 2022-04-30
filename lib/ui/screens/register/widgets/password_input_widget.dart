import 'package:flutter/material.dart';

import '../../../widgets/text_input_widget.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid passcode';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      hintText: 'Password',
      prefixIcon: Icons.lock,
      prefixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
      obscureText: true,
      onChanged: (String value) {},
    );
  }
}
