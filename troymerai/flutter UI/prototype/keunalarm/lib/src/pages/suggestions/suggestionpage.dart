import 'package:flutter/material.dart';
import 'package:keunalarm/src/pages/suggestions/suggestionview.dart';

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
        centerTitle: true,
        title: Text('건의사항 목록'),
      ),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height * 0.9,
        child: firestoreSuggestionView(),
      ),
    );
  }
}
