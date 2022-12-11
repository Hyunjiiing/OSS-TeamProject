import 'package:flutter/material.dart';
import 'package:keunalarm/src/pages/phonebookpage/phonebookview.dart';

import '../../components/color.dart';

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
        backgroundColor: HexColor("#f0fafc"),
        centerTitle: true,
        elevation: 0,
        title: Text(
          '학내 전화번호 목록',
          style: TextStyle(
            fontSize: 25,
            fontFamily: "NanumEB",
          ),
        ),
      ),
      body: Container(
        color: HexColor("#f0fafc"),
        height: MediaQuery.of(context).size.height * 0.9,
        child: phoneBookView(),
      ),
    );
  }
}
