import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/ui/screens/result/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PercentContainerWidget extends StatelessWidget {
  const PercentContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ayesha')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('result')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }

          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  Container(
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
                          children: [
                            const TextWidget(
                                title: 'Percentage',
                                bgColor: Colors.yellow,
                                textColor: Colors.white),
                            const SizedBox(
                              width: 65,
                            ),
                            TextWidget(
                                title: data['percentage'],
                                bgColor: Colors.white,
                                textColor: Colors.black),
                            const SizedBox(
                              width: 70,
                            ),
                            const TextWidget(
                                title: 'Grade',
                                bgColor: Colors.yellow,
                                textColor: Colors.white),
                            const SizedBox(
                              width: 40,
                            ),
                            TextWidget(
                                title: data['grade'],
                                bgColor: Colors.white,
                                textColor: Colors.black),
                            const SizedBox(
                              width: 40,
                            ),
                            const TextWidget(
                                title: 'Highest %\nin the class',
                                bgColor: Colors.yellow,
                                textColor: Colors.white),
                            const SizedBox(
                              width: 40,
                            ),
                            TextWidget(
                                title: data['percentage'],
                                bgColor: Colors.white,
                                textColor: Colors.black)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        });
  }
}
