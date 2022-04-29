import 'package:flutter/material.dart';

class RoundedContainerWidget extends StatelessWidget {
  const RoundedContainerWidget({ Key? key, required this.title, }) : super(key: key);
  final String title;
  
 

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      
  
      child:  Text(title,style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight:FontWeight.bold,color: Colors.black)),
    );
  }
}