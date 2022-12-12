import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/components/image_data.dart';
import 'package:keunalarm/src/pages/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../components/color.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen(_foregroundHandler);
    super.initState();
  }

  void _foregroundHandler(RemoteMessage message) async {
    setState(() {
      // showDialog(
      //     context: context,
      //     barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
      //         actions: [
      //           // TextButton(
      //           //   child: const Text('새로운 공지가 도착했습니다.'),
      //           //   onPressed: () {
      //           //     Navigator.push(context,
      //           //         MaterialPageRoute(builder: (context) => MainPage()));
      //               ;
      //             },
      //           ),
      //         ],
      //       );
      //     });
      final snackBar = SnackBar(content: Text("새로운 공지가 도착했습니다"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#f0fafc"),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/img_keunalarmlogo.png",
                width: MediaQuery.of(context).size.width * 0.4,
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
                        fontFamily: "NanumB",
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
            height: MediaQuery.of(context).size.height * 0.35,
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
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 100,
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/img_cosmiclogo.png",
                          width: MediaQuery.of(context).size.width * 0.45,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: 100,
                        child: Center(
                          child: Text(
                            'cosmic\n눈송이 캠프\n멤버 영입중!',
                            style: TextStyle(
                              fontFamily: "NanumB",
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
                    child: Center(
                        child: Text(
                      '동아리 홍보나 영입 공고 배너',
                      style: TextStyle(
                        fontFamily: "NanumB",
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      '동아리 홍보나 영입 공고 배너',
                      style: TextStyle(
                        fontFamily: "NanumB",
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      '동아리 홍보나 영입 공고 배너',
                      style: TextStyle(
                        fontFamily: "NanumB",
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      '동아리 홍보나 영입 공고 배너',
                      style: TextStyle(
                        fontFamily: "NanumB",
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      '동아리 홍보나 영입 공고 배너',
                      style: TextStyle(
                        fontFamily: "NanumB",
                        fontSize: 20,
                      ),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(7, 7, 7, 7),
                    width: double.infinity,
                    height: 100,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        '동아리 홍보나 영입 공고 배너',
                        style: TextStyle(
                          fontFamily: "NanumB",
                          fontSize: 20,
                        ),
                      ),
                    ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.circle_notifications,
                    color: HexColor("#0097BD"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Text(
                      '공지사항 보러가기',
                      style: TextStyle(
                        fontFamily: "NanumEB",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Get.to(
                Home(),
              );
            },
          )
        ],
      ),
    );
  }
}
