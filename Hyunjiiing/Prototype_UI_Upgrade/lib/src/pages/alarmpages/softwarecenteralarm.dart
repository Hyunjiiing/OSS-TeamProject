import 'package:flutter/material.dart';
import '../../components/color.dart';
import '../../events/firestore_softwarecenterevent.dart';

class softwareCenterAlarm extends StatefulWidget {
  const softwareCenterAlarm({super.key});

  @override
  State<softwareCenterAlarm> createState() => _softwareCenterAlarmState();
}

class _softwareCenterAlarmState extends State<softwareCenterAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#f0fafc"),
      height: MediaQuery.of(context).size.height * 0.73,
      child: firestoreSoftwareCenterEvent(),
    );
  }
}
