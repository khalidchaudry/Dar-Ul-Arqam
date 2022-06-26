import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerWidget extends StatefulWidget {
  final Function(String date) onPressed;
  const ContainerWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  var date = DateTime.now();
  void _dateSelection(context) async {
    DateTime? dateTime = await showDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025),
        context: context);
    if (dateTime != null) {
      setState(() {
        date = dateTime;
      });
      widget.onPressed(DateFormat('dd/MM/yyyy').format(date));
    }
  }

  @override
  Widget build(BuildContext context) {
    final f = DateFormat('dd/MM/yyyy');
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Homework Diary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Divider(),
            const Text(
              'Date',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 0,
            ),
            Row(
              children: [
                Expanded(child: Text(f.format(date))),
                IconButton(
                    onPressed: () {
                      _dateSelection(context);
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).primaryColor,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
