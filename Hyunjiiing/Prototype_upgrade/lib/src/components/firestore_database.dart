import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class fireStoreDatabase extends StatefulWidget {
  const fireStoreDatabase({super.key});

  @override
  State<fireStoreDatabase> createState() => _fireStoreDatabaseState();
}

class _fireStoreDatabaseState extends State<fireStoreDatabase> {
  CollectionReference event = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
