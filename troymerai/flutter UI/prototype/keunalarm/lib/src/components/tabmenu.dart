import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:keunalarm/src/pages/alarmpages/popularalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/softwarecenteralarm.dart';
import 'package:keunalarm/src/pages/alarmpages/untitledalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/computerenginerringalarm.dart';

class tabMenu extends StatefulWidget {
  const tabMenu({super.key});

  @override
  State<tabMenu> createState() => _tabMenuState();
}

class _tabMenuState extends State<tabMenu> with TickerProviderStateMixin {
  late TabController tabController;

  List<String> items = [
    "인기",
    "컴퓨터 공학과",
    "소프트웨어 중심 사업단",
    "미정",
    "경영학과",
    "토목공학과",
    "전자공학과",
    "경제학과",
    "심리학과",
  ];

  List pages = [
    popularAlarm(),
    computerEngineeringAlarm(),
    softwareCenterAlarm(),
    untitledAlarm(),
    untitledAlarm(),
    untitledAlarm(),
    untitledAlarm(),
    untitledAlarm(),
    untitledAlarm(),

    /*
      popularAlarm(),
      computerEngineeringAlarm(),
      softwareCenterAlarm(),
      untitledAlarm(),
      */
  ];

  int current = 0;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    /*
    //tabcontroller의 length에서 안에 들어갈 component의 개수를 지정할 수 있다
    tabController = TabController(length: 4, vsync: this);
    */
  }

  Widget _tabMenuText(String text) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }
/*
  Widget pages(pageindex) {
    switch (pageindex) {
      case (index == 1):
        return popularAlarm();
    }
  }
  */

  /*

/** 인기 공지사항 ui 만드는 곳 */
  Widget popularAlarm() {
    return Container(
      height: 200,
      child: fireStoreEvent(),
    );
  }

/** 컴공 공지사항 ui 만드는 곳 */
  Widget computerEngineeringAlarm() {
    return Container(
      child: Center(
        child: Text('컴공 페이지'),
      ),
    );
  }

/** 소중단 공지사항 ui 만드는 곳 */
  Widget softwareCenterAlarm() {
    return Container(
      child: Center(
        child: Text('소중단 페이지'),
      ),
    );
  }

/** 미정 공지사항 ui 만드는 곳 */
  Widget untitledAlarm() {
    return Container(
      child: Center(
        child: Text('미정 페이지'),
      ),
    );
  }

  */

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 10,
            color: Colors.grey[300],
            //Color(0xFFE7ECEF),
          ),
          Container(
            color: Colors.grey[300],
            height: 60,
            width: double.infinity,
            child: ListView.builder(
              //itemCount는 list item의 개수에 맞춰서 listview의 개수를 만들어주는 변수
              itemCount: items.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        current = index;
                        isPressed = !isPressed;
                      },
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 200,
                    ),
                    margin: EdgeInsets.fromLTRB(10, 10, 7, 7),
                    width: 100,
                    height: 45,
                    decoration: BoxDecoration(
                      color: current == index ? Colors.white : Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: current == index
                          ? null
                          : [
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: AutoSizeText(
                          items[index],
                          style: TextStyle(
                            fontSize: 15,
                            color: current == index
                                ? Colors.black
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.73,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pages[current],
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    /*
    Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          // 공지사항 옆으로 넘기면서 카테고리 보기
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xffe4e4e4),
              ),
            ),
          ),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            controller: tabController,
            tabs: [
              // tab에 더 넣고싶으면 tabcontroller의 length 늘리기
              _tabMenuText('인기'),
              _tabMenuText('컴퓨터 공학과'),
              _tabMenuText('소프트웨어 중심 사업단'),
              _tabMenuText('미정'),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.76,
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    child: popularAlarm(),
                  ),
                  Container(
                    child: computerEngineeringAlarm(),
                  ),
                  Container(
                    child: softwareCenterAlarm(),
                  ),
                  Container(
                    child: untitledAlarm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    */
  }
}
