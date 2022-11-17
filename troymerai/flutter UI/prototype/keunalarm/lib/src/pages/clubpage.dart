import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clubpages/computerclubpage.dart';
import 'clubpages/schoolclubpage.dart';

class clubPage extends StatelessWidget {
  const clubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.blue,
          child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
        ),
        SizedBox(
          height: 150,
        ),
        GestureDetector(
          onTap: () {
            Get.to(computerClubPage());
          },
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.grey,
            child: Center(child: Text('컴퓨터 공학과 학과 동아리')),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            Get.to(schoolClubPage());
          },
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
            child: Center(child: Text('중앙 동아리')),
          ),
        ),
      ],
    );
  }
}
