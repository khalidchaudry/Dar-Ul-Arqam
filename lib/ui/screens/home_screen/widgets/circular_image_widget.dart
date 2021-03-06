import 'package:flutter/material.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({
    Key? key,
    required this.title,
    required this.press,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: press,
          child: CircleAvatar(
            radius: 43,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(image),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
