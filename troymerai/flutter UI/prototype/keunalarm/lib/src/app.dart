import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/controller/bottom_nav_controller.dart';
import 'package:keunalarm/src/pages/home.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(
        () => Scaffold(
          //appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Home(),
              Container(
                child: Center(child: Text('CALENDER')),
              ),
              Container(
                child: Center(child: Text('MYPAGE')),
              ),
            ],
          ),
          bottomNavigationBar: SafeArea(
            child: BottomNavigationBar(
                //bottomnavigationbar에 있는 아이콘 안튀어오르게 함
                type: BottomNavigationBarType.fixed,
                //bottomnavigationbar에 있는 라벨 안보이게 함
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.grey,
                elevation: 0,
                currentIndex: controller.pageIndex.value,
                onTap: controller.changeBottomNav,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        // color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.home,
                        color: Colors.black,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.calendar,
                        //color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.calendar,
                        color: Colors.black,
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.bars,
                        //color: Colors.black,
                      ),
                      activeIcon: Icon(
                        CupertinoIcons.bars,
                        color: Colors.black,
                      ),
                      label: ""),
                ]),
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
    );
  }
}
