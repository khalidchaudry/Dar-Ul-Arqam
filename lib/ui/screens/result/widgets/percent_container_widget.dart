import 'package:darularqam/ui/screens/result/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PercentContainerWidget extends StatelessWidget {
  const PercentContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: Colors.yellow),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TextWidget(
                  title: 'Percentage',
                  bgColor: Colors.yellow,
                  textColor: Colors.white),
              SizedBox(
                width: 65,
              ),
              TextWidget(
                  title: '86%', bgColor: Colors.white, textColor: Colors.black),
              SizedBox(
                width: 70,
              ),
              TextWidget(
                  title: 'Grade',
                  bgColor: Colors.yellow,
                  textColor: Colors.white),
              SizedBox(
                width: 40,
              ),
              TextWidget(
                  title: 'A', bgColor: Colors.white, textColor: Colors.black),
              SizedBox(
                width: 40,
              ),
              TextWidget(
                  title: 'Highest %\nin the class',
                  bgColor: Colors.yellow,
                  textColor: Colors.white),
              SizedBox(
                width: 40,
              ),
              TextWidget(
                  title: '86%', bgColor: Colors.white, textColor: Colors.black)
            ],
          ),
        ),
      ),
    );
  }
}
