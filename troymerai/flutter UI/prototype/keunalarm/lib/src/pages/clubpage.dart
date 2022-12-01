import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clubpages/computerclubpage.dart';
import 'clubpages/schoolclubpage.dart';

class clubPage extends StatelessWidget {
  const clubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.53,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(computerClubPage());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 180,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: Offset(4, 4),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(child: Text('컴퓨터 공학과\n  학과 동아리')),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(schoolClubPage());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 180,
                    //  color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: Offset(4, 4),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Center(child: Text('충북대학교\n중앙 동아리')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
