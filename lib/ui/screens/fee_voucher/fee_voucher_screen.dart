import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class FeeVoucherScree extends StatefulWidget {
  final Map student;

  const FeeVoucherScree({Key? key, required this.student}) : super(key: key);

  @override
  State<FeeVoucherScree> createState() => _FeeVoucherScreeState();
}

class _FeeVoucherScreeState extends State<FeeVoucherScree> {
  bool _loading = false;

  FirebaseFirestore cloud_firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> days = [];

  @override
  void initState() {
    super.initState();
    _getFeeVoucher();
  }

  _getFeeVoucher() async {
    setState(() {
      _loading = true;
      days = [];
    });
    QuerySnapshot querySnapshot = await cloud_firestore
        .collection('parents')
        .doc(_auth.currentUser!.uid)
        .collection('childs')
        .doc(widget.student['s_id'])
        .collection('fee_voucher')
        .get();

    List<QueryDocumentSnapshot> _list = querySnapshot.docs;
    if (_list.isNotEmpty) {
      for (var element in _list) {
        days.add(element.data() as Map<String, dynamic>);
      }
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Fee Voucher'),
          backgroundColor: const Color(0xFF191581),
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: days
                    .map((e) => Card(
                        margin: const EdgeInsets.all(6),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewWidget(
                                        title: e['title'], url: e['file'])));
                          },
                          leading: const Icon(Icons.picture_as_pdf),
                          title: Text(e['title']),
                          trailing: e['is_paid']
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                )
                              : const Icon(
                                  Icons.pending,
                                  color: Colors.red,
                                ),
                        )))
                    .toList(),
              ));
  }
}
