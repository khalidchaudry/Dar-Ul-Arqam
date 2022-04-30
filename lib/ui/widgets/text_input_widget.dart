import 'package:flutter/material.dart';

// For login and register globally use

class TextInputWidget extends StatelessWidget {
  const TextInputWidget(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      this.onChanged,
      this.obscureText = false,
      this.autofocus = false,
      this.textInputAction,
      this.prefixIconConstraints,
      this.textInputType,
      this.textCapitalization,
      this.initialValue,
      required this.validator})
      : super(key: key);

  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final bool autofocus;
  final FormFieldValidator validator;
  final TextInputAction? textInputAction;
  final Function(String value)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      autofocus: autofocus,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: const Color(0xff7477A0)),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          prefixIconConstraints: prefixIconConstraints ??
              const BoxConstraints(maxHeight: 52, maxWidth: 52),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 14),
            child: Icon(
              prefixIcon,
            ),
          )),
      textInputAction: textInputAction,
      keyboardType: textInputType,
    );
  }
}
