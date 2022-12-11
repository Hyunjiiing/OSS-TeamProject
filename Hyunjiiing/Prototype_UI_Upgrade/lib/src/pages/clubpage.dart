import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'clubpages/computerclubpage.dart';
import 'clubpages/schoolclubpage.dart';
import '../components/color.dart';

class clubPage extends StatelessWidget {
  const clubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#f0fafc"),
        appBar: AppBar(
          backgroundColor: HexColor("#f0fafc"),
          title: Center(
              child: Text(
            '동아리 소개',
            style: TextStyle(
                fontSize: 25,
                fontFamily: "NanumEB",
                fontWeight: FontWeight.bold),
          )),
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: HexColor("#f0fafc"),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                        width: double.infinity,
                        height: 300,
                        color: Colors.white,
                        child: Column(children: [
                          Image.asset(
                            "assets/images/cosmic_logo.png",
                            width: 150,
                          ),
                          Text(
                            '[ COSMIC 모집 공고 : 11.14(월) ~11.25(금) ]\n ',
                            style:
                                TextStyle(fontFamily: "NanumEB", fontSize: 20),
                          ),
                          Text(
                            '안녕하세요. 컴퓨터공학과 프로젝트 동아리 COSMIC 입니다. \n저희 동아리는 현재 웹/앱을 중심으로 다양한 주제의 프로젝트를 계획 및 실행하고 있으며, \n공모전이나 컨퍼런스 등의 대외활동에 참석하거나 학술 스터디를 운영하며 꾸준히 발전하고 있는 동아리입니다. \n이번 모집을 통해 겨울방학부터 프로젝트를 같이 진행할 부원을 모집하고자 합니다. \n아래의 요건에 하나라도 충족한다고 생각하는 학우분이라면 과감하게 지원 부탁드립니다. 감사합니다. ',
                            style:
                                TextStyle(fontFamily: "NanumB", fontSize: 20),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          '컴퓨터공학과\n\n  학과 동아리',
                          style: TextStyle(
                            fontFamily: "NanumEB",
                            fontSize: 20,
                          ),
                        )),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          '충북대학교\n\n중앙 동아리',
                          style: TextStyle(
                            fontFamily: "NanumEB",
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
