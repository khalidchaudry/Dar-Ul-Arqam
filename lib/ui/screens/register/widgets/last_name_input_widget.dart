import 'package:flutter/material.dart';

import '../../../widgets/text_input_widget.dart';

class LastNameInputWidget extends StatelessWidget {
  const LastNameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputWidget(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your last name';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      hintText: 'Last Name',
      prefixIcon: Icons.person,
      prefixIconConstraints: const BoxConstraints(maxHeight: 48, maxWidth: 48),
      onChanged: (String value) {},
    );
  }
}
