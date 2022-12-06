import 'package:flutter/material.dart';

import '../../events/firestore_cbnualarm.dart';

class CBNUAlarmPage extends StatefulWidget {
  const CBNUAlarmPage({super.key});

  @override
  State<CBNUAlarmPage> createState() => _CBNUAlarmPageState();
}

class _CBNUAlarmPageState extends State<CBNUAlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.73,
      child: firestoreCBNUEvent(),
    );
  }
}
