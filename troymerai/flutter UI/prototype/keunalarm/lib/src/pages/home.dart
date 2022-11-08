import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keunalarm/src/components/tabmenu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

// 공지사항 옆으로 넘기면서 카테고리 보기
  Widget _tabMenu() {
    return SizedBox(
      child: tabMenu(),
    );
  }

// 공지사항 내용 아래로 내리면서 보기
  Widget _tabView() {
    return Expanded(
      // getX widget 다시 공부해서 상태연결하기
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 여기서 appbar 없애고 그냥 body에 몰빵해서 appbar느낌으로 ui 구현하면 됨
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Center(
          child: Text(
            '큰알람',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Icon(
            CupertinoIcons.bars,
            color: Colors.black,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: tabMenu()),
          //_tabMenu(),
          //_tabView(),
        ],
      ),
    );
  }
}
