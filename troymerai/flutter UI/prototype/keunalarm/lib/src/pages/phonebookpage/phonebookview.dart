import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class phoneBookView extends StatefulWidget {
  phoneBookView({super.key});

  @override
  State<phoneBookView> createState() => _phoneBookViewState();
}

class _phoneBookViewState extends State<phoneBookView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '전자정보대학 학장',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-3281',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432613281');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '전기공학부 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-2419',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432612419');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '전자공학부 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-2473',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432612473');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '정보통신공학부 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-2480',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432612480');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '컴퓨터공학과 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-2449',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432612449');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '소프트웨어학부 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-2260',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432612260');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '지능로봇공학과 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-3225',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432613225');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '전자정보대학 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-261-3528',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432613528');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
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
              color: Colors.white54,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(4, 4),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '소프트웨어중심사업단 행정실',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '043-249-1833',
                            style: TextStyle(fontFamily: "NanumB"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber('0432491833');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 80,
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
