import 'package:flutter/material.dart';

class tabMenu extends StatefulWidget {
  const tabMenu({super.key});

  @override
  State<tabMenu> createState() => _tabMenuState();
}

class _tabMenuState extends State<tabMenu> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    //tabcontroller의 length에서 안에 들어갈 component의 개수를 지정할 수 있다
    tabController = TabController(length: 4, vsync: this);
  }

  Widget _tabMenuText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

/*
  Widget _tabViewScroll() {
    return Container(
        // 공지사항 페이지 ui
        );
  }
  */

/** 인기 공지사항 ui 만드는 곳 */
  Widget popularAlarm() {
    return Container(
      child: Center(
        child: Text('인기 페이지'),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            controller: tabController,
            tabs: [
              // tab에 더 넣고싶으면 tabcontroller의 length 늘리기
              _tabMenuText('인기'),
              _tabMenuText('컴공'),
              _tabMenuText('소중단'),
              _tabMenuText('미정'),
            ],
          ),
        ),
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
    );
  }
}
