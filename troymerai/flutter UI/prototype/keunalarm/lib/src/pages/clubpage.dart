import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'clubpages/computerclubpage.dart';
import 'clubpages/schoolclubpage.dart';

class clubPage extends StatelessWidget {
  const clubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.grey[300],
            child: Center(
              child: Text(
                '동아리 페이지',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            color: Colors.grey[300],
            child: Center(
              child: Image.asset(
                "assets/images/img_happyboong.png",
                width: MediaQuery.of(context).size.width * 0.6,
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
