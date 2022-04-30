import 'package:flutter/material.dart';

import '../../../widgets/text_input_widget.dart';

class FirstNameInputWidget extends StatelessWidget {
  const FirstNameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your first name';
        }
        return null;
      },
      autofocus: true,
      textInputAction: TextInputAction.next,
      hintText: 'First Name',
      prefixIcon: Icons.person,
      prefixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
      onChanged: (String value) {},
    );
  }
}
