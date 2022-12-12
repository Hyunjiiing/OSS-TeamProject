import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/pages/phonebookpage/phonebookpage.dart';
import 'package:keunalarm/src/pages/suggestions/suggestionpage.dart';

import '../components/color.dart';

class myPage extends StatefulWidget {
  myPage({super.key});

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  final TextEditingController textController = TextEditingController();

  CollectionReference suggestion =
      FirebaseFirestore.instance.collection('suggestion');

  Future<void> _write() async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: '여기에 적어주세요!',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final String suggestionlist = textController.text;
                      await suggestion.add({'suggestion': suggestionlist});

                      textController.text = "";
                      Navigator.of(context).pop();
                    },
                    child: Text('일 시키기'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f0fafc"),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.07,
            color: HexColor("#f0fafc"),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: HexColor("#f0fafc"),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Bubble(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      borderColor: Colors.white,
                      borderWidth: 2,
                      margin: BubbleEdges.all(8),
                      nip: BubbleNip.rightBottom,
                      elevation: 0,
                      child: AutoSizeText(
                        '저를 눌러서 \n필요한 기능들을 \n알려주세요!',
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "NanumB",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: HexColor("#f0fafc"),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.23,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _write();
                },
                child: Container(
                  color: HexColor("#f0fafc"),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.38,
                  child: Image.asset(
                    "assets/images/img_studyboong.png",
                    width: MediaQuery.of(context).size.width * 0.46,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.475,
            color: HexColor("#f0fafc"),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(suggestionPage());
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(13, 13, 13, 8),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!,
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
                      child: Center(
                        child: Text(
                          '건의사항 목록',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "NanumEB",
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(phoneBookPage());
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(13, 13, 13, 8),
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!,
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
                      child: Center(
                        child: Text(
                          '학내 전화번호 목록',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "NanumEB",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
