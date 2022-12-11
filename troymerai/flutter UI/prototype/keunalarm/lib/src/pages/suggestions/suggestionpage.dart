import 'package:flutter/material.dart';
import 'package:keunalarm/src/pages/suggestions/suggestionview.dart';

import '../../components/color.dart';

class suggestionPage extends StatefulWidget {
  suggestionPage({super.key});

  @override
  State<suggestionPage> createState() => _suggestionPageState();
}

class _suggestionPageState extends State<suggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#f0fafc"),
        centerTitle: true,
        elevation: 0,
        title: Text(
          '건의사항 목록',
          style: TextStyle(
            fontSize: 25,
            fontFamily: "NanumEB",
          ),
        ),
      ),
      body: Container(
        color: HexColor("#f0fafc"),
        height: MediaQuery.of(context).size.height * 0.9,
        child: firestoreSuggestionView(),
      ),
    );
  }
}
