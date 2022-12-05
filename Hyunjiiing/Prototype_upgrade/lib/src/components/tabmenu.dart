import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:keunalarm/src/pages/alarmpages/popularalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/softwarecenteralarm.dart';
import 'package:keunalarm/src/pages/alarmpages/untitledalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/computerenginerringalarm.dart';
import 'package:keunalarm/src/pages/testpage.dart';

import '../pages/alarmpages/CBNUscholarshipalarm.dart';
import '../pages/alarmpages/ecealarm.dart';

class tabMenu extends StatefulWidget {
  const tabMenu({super.key});

  @override
  State<tabMenu> createState() => _tabMenuState();
}

class _tabMenuState extends State<tabMenu> with TickerProviderStateMixin {
  late TabController tabController;

  List<String> items = [
    "인기",
    "테스트",
    "컴퓨터 공학과",
    "소프트웨어 중심 사업단",
    "전자정보대학",
    "CBNU 장학",
    "토목공학과",
    "전자공학과",
    "경제학과",
    "심리학과",
  ];

  List pages = [
    popularAlarm(),
    TestPage(),
    computerEngineeringAlarm(),
    softwareCenterAlarm(),
    eceAlarm(),
    CBNUScholarshipAlarm(),
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
                      color:
                          current == index ? Color(0xffD3C9B5) : Colors.white54,
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
                width: double.infinity,
                height: 10,
                color: Colors.grey[300],
                //Color(0xFFE7ECEF),
              ),
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
  }
}
