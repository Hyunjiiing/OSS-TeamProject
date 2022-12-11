import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/components/image_data.dart';
import 'package:keunalarm/src/pages/home.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/img_keunalarmlogo.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(7, 5, 7, 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '알람 놓치면\n큰일남!\n\n큰알람에서\n중요한 공지\n알아가세요!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/img_killboong.png",
                          width: MediaQuery.of(context).size.width * 0.46,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(7, 5, 7, 5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 100,
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/img_cosmiclogo.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 100,
                        child: Center(
                          child: Text(
                            'cosmic\n눈송이 캠프\n멤버 영입중!',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 7),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(child: Text('동아리 홍보나 영입 공고 배너')),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.fromLTRB(7, 5, 7, 5),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '공지사항 바로 보러가기',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            onTap: () {
              Get.to(
                Home(),
              );
            },
          ),
        ],
      ),
    );
  }
}
