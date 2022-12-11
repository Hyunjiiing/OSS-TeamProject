import 'package:flutter/material.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:keunalarm/src/events/firestore_computerengineeringevent.dart';

import '../../components/color.dart';

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
      color: HexColor("#f0fafc"),
      height: MediaQuery.of(context).size.height * 0.72,
      child: firestoreComputerEngineeringEvent(),
    );
  }
}
