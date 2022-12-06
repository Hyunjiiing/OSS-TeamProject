import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class dueDateEvent extends StatefulWidget {
  const dueDateEvent({super.key});

  @override
  State<dueDateEvent> createState() => _dueDateEventState();
}

void timesequence() {
  var now = DateTime.now();
}

class _dueDateEventState extends State<dueDateEvent> {
  CollectionReference time =
      FirebaseFirestore.instance.collection('Calender_undergraduate');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: time.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container();
        },
      ),
    );
  }
}
