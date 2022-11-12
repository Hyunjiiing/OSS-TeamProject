import 'package:flutter/material.dart';

class softwareCenterAlarm extends StatefulWidget {
  const softwareCenterAlarm({super.key});

  @override
  State<softwareCenterAlarm> createState() => _softwareCenterAlarmState();
}

class _softwareCenterAlarmState extends State<softwareCenterAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        '소중단 페이지',
      )),
    );
  }
}
