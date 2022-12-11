import 'package:flutter/material.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import '../../components/color.dart';

class popularAlarm extends StatefulWidget {
  popularAlarm({super.key});
  @override
  State<popularAlarm> createState() => _popularAlarmState();
}

class _popularAlarmState extends State<popularAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#f0fafc"),
      height: MediaQuery.of(context).size.height * 0.7,
      child: fireStoreEvent(),
    );
  }
}
