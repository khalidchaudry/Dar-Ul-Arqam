import 'package:darularqam/ui/screens/time_table/widgets/widgets.dart';
import 'package:darularqam/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTable();
}

@override
class _TimeTable extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: const Text('Time Table'),
          backgroundColor: appBarColor,
          backButtonCallback: () => Navigator.pop(context),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              PlayToNurseryTimeTableWidget(),
              SizedBox(
                height: 20,
              ),
              PrepToMetricTimeTableWidget()
            ],
          ),
        ));
  }
}
