import 'package:flutter/material.dart';

import '../../events/firestore_cbnuscholarshipevent.dart';

class CBNUScholarshipAlarm extends StatefulWidget {
  CBNUScholarshipAlarm({super.key});

  @override
  State<CBNUScholarshipAlarm> createState() => _CBNUScholarshipAlarmState();
}

class _CBNUScholarshipAlarmState extends State<CBNUScholarshipAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.73,
      child: firestoreCBNUScholarshipEvent(),
    );
  }
}
