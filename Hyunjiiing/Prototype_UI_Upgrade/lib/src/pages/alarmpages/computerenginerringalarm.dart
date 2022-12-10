import 'package:flutter/material.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:keunalarm/src/events/firestore_computerengineeringevent.dart';

class computerEngineeringAlarm extends StatefulWidget {
  const computerEngineeringAlarm({super.key});

  @override
  State<computerEngineeringAlarm> createState() =>
      _computerEngineeringAlarmState();
}

class _computerEngineeringAlarmState extends State<computerEngineeringAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.72,
      child: firestoreComputerEngineeringEvent(),
    );
  }
}
