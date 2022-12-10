import 'package:flutter/material.dart';

class untitledAlarm extends StatefulWidget {
  const untitledAlarm({super.key});

  @override
  State<untitledAlarm> createState() => _untitledAlarmState();
}

class _untitledAlarmState extends State<untitledAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '미정 페이지',
      )),
    );
  }
}
