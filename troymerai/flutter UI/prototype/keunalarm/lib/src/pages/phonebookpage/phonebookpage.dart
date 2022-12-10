import 'package:flutter/material.dart';
import 'package:keunalarm/src/pages/phonebookpage/phonebookview.dart';

class phoneBookPage extends StatefulWidget {
  phoneBookPage({super.key});

  @override
  State<phoneBookPage> createState() => _phoneBookPageState();
}

class _phoneBookPageState extends State<phoneBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('학내 전화번호 목록'),
      ),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height * 0.9,
        child: phoneBookView(),
      ),
    );
  }
}
