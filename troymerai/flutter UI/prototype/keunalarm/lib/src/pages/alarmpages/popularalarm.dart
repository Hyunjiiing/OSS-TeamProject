import 'package:flutter/material.dart';
import 'package:keunalarm/src/components/firestore_event.dart';

class popularAlarm extends StatefulWidget {
  const popularAlarm({super.key});

  @override
  State<popularAlarm> createState() => _popularAlarmState();
}

class _popularAlarmState extends State<popularAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.7,
      child: fireStoreEvent(),
    );
  }
}
