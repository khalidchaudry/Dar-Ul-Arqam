import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darularqam/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends StatefulWidget {
  final Map student;
  const ReportsScreen({Key? key, required this.student}) : super(key: key);

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  bool _loading = false;

  FirebaseFirestore cloud_firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Map<String, dynamic>> days = [];

  List<String> months = [
    'January',
    'January',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    super.initState();
    _getAttendance(months[DateTime.now().month - 1]);
  }

  _getAttendance(String month) async {
    setState(() {
      _loading = true;
      days = [];
    });
    QuerySnapshot querySnapshot = await cloud_firestore
        .collection('parents')
        .doc(_auth.currentUser!.uid)
        .collection('childs')
        .doc(widget.student['s_id'])
        .collection('reports')
        .where('month', isEqualTo: month.toLowerCase())
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
        title: const Text('Result Screen'),
        backgroundColor: const Color(0xFF191581),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: bGColor)),
        child: Column(
          children: [
            DailyAttendenceWidget(
              days: days,
              months: months,
              callBack: (String date) {
                _getAttendance(date);
              },
            ),
            AttendenceReportWidget(
              days: days,
            ),
          ],
        ),
      ),
    );
  }
}

class AttendenceReportWidget extends StatelessWidget {
  const AttendenceReportWidget({Key? key, required this.days})
      : super(key: key);

  final List<Map<String, dynamic>> days;

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance
    //         .collection('ayesha')
    //         .doc(FirebaseAuth.instance.currentUser!.uid)
    //         .collection('attendence')
    //         .snapshots(),
    //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Center(child: Text('Something went wrong'));
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const CircularProgressIndicator.adaptive();
    //       }

    //       r
    //     });

    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(),
              children: [
                const TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Date',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        ),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'subject',
                        textAlign: TextAlign.center,
                        style: headingTextStyle,
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Total Marks',
                        textAlign: TextAlign.center,
                        style: headingTextStyle,
                      ),
                    ),
                  ),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Obtain Marks',
                          textAlign: TextAlign.center,
                          style: headingTextStyle,
                        ),
                      )),
                ]),
                ...days.map(
                  (data) {
                    var timestamp = data['date'];
                    return TableRow(children: [
                      TableCell(
                          child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // Timestamp.fromDate(
                            //         (data['date'] as Timestamp).toDate())
                            //     .toString(),
                            timestamp.toString(),
                            style: headingTextStyle,
                          ),
                        ),
                      )),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['subject'],
                              style: headingTextStyle,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['total_marks'],
                              style: headingTextStyle,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data['obtain_marks'],
                              style: headingTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ]);
                  },
                ).toList(),
              ],
            ),
          )),
    );
  }
}

class DailyAttendenceWidget extends StatefulWidget {
  final Function(String month) callBack;
  final List<String> months;
  final List<Map<String, dynamic>> days;
  const DailyAttendenceWidget(
      {Key? key,
      required this.callBack,
      required this.months,
      required this.days})
      : super(key: key);

  @override
  State<DailyAttendenceWidget> createState() => _DailyAttendenceWidgetState();
}

class _DailyAttendenceWidgetState extends State<DailyAttendenceWidget> {
  late String selectedMonth;

  @override
  void initState() {
    super.initState();
    selectedMonth = widget.months[DateTime.now().month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Attendence',
              style: headingTextStyle,
            ),
            const Divider(
              thickness: 2,
              endIndent: 180,
            ),
            Row(
              children: [
                const Text(
                  'Month :',
                  style: headingTextStyle,
                ),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                  // Initial Value
                  value: selectedMonth,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: widget.months.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue!;
                    });
                    widget.callBack(newValue!);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
