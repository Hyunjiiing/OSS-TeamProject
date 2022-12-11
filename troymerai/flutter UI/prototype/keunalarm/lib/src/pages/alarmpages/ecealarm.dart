import 'package:flutter/material.dart';

import '../../components/color.dart';
import '../../events/firestore_eceevent.dart';

class eceAlarm extends StatefulWidget {
  const eceAlarm({super.key});

  @override
  State<eceAlarm> createState() => _eceAlarmState();
}

class _eceAlarmState extends State<eceAlarm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#f0fafc"),
      height: MediaQuery.of(context).size.height * 0.73,
      child: firestoreECEEvent(),
    );
  }
}
