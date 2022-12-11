import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../components/color.dart';

class computerClubPage extends StatelessWidget {
  const computerClubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f0fafc"),
      appBar: AppBar(
        backgroundColor: HexColor("#f0fafc"),
        elevation: 0,
        leadingWidth: 0,
        title: Center(
          child: Text(
            '컴퓨터공학과 동아리',
            style: TextStyle(fontSize: 25, fontFamily: "NanumEB"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '   동아리명 :',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 25,
                        child: AutoSizeText(
                          'COSMIC',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리 소개 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          '머신러닝을 주제로 자연어 처리, 이미지 인식, 추천 시스템, 데이터 분석 등 다양한 주제에 대한 학습과 응용 프로젝트 진행',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리명 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 25,
                        child: AutoSizeText(
                          'C.E.R.T',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리 소개 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          '네트워크, 시스템, 웹 기반의 정보보호학습, 모의해킹 및 해킹방어대회 참가, 정보보호 관련 대외활동',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리명 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 25,
                        child: AutoSizeText(
                          'I.P.S.E',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리 소개 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          'C/C++, JAVA, MFC 등 관심 주제를 토론 및 학습, 창의적인 소프트웨어 개발, ACM-ICPC 대회 참가',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리명 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 25,
                        child: AutoSizeText(
                          'E.M.B.E',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 25,
                        child: AutoSizeText(
                          '동아리 소개 : ',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumEB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.73,
                        height: 40,
                        padding: EdgeInsets.only(top: 10),
                        child: AutoSizeText(
                          'IOT와 임베디드 시스템에서 동작하는 다양한 어플리케이션 개발과 장비 구동에 필요한 OS 연구',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "NanumB",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
