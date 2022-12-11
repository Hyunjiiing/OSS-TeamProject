import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:keunalarm/src/pages/alarmpages/popularalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/softwarecenteralarm.dart';
import 'package:keunalarm/src/pages/alarmpages/untitledalarm.dart';
import 'package:keunalarm/src/pages/alarmpages/computerenginerringalarm.dart';

import '../pages/alarmpages/CBNUscholarshipalarm.dart';
import '../pages/alarmpages/cbnualarm.dart';
import '../pages/alarmpages/ecealarm.dart';
import '../components/color.dart';

class tabMenu extends StatefulWidget {
  const tabMenu({super.key});

  @override
  State<tabMenu> createState() => _tabMenuState();
}

class _tabMenuState extends State<tabMenu> with TickerProviderStateMixin {
  late TabController tabController;

  List<String> items = [
    "컴퓨터공학과",
    "SW중심사업단",
    "전자정보대학",
    "CBNU 장학",
    "CBNU 공지",
  ];

  List pages = [
    computerEngineeringAlarm(),
    softwareCenterAlarm(),
    eceAlarm(),
    CBNUScholarshipAlarm(),
    CBNUAlarmPage(),

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
        style:
            TextStyle(fontSize: 20, color: Colors.black, fontFamily: "NanumEB"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#f0fafc"),
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 10,
            color: HexColor("#f0fafc"),

            //Color(0xFFE7ECEF),
          ),
          Container(
            color: HexColor("#f0fafc"),
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 45,
                    decoration: BoxDecoration(
                      color: current == index
                          ? Colors.white
                          : Color.fromARGB(104, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(9, 8, 8, 8),
                      child: Center(
                          child: Row(
                        children: [
                          if (current == index)
                            Icon(
                              Icons.star,
                              size: 15,
                            ),
                          AutoSizeText(
                            items[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "NanumEB",
                              color: current == index
                                  ? Colors.black
                                  : Color.fromARGB(162, 117, 117, 117),
                            ),
                          ),
                        ],
                      )),
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
