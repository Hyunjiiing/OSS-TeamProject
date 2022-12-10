import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/pages/phonebookpage/phonebookview.dart';
import 'package:keunalarm/src/pages/suggestions/suggestionpage.dart';

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
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'suggestion',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String suggestionlist = textController.text;
                    await suggestion.add({'suggestion': suggestionlist});

                    textController.text = "";
                    Navigator.of(context).pop();
                  },
                  child: Text('suggest'),
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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 100,
                    child: Bubble(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      borderColor: Colors.white,
                      borderWidth: 2,
                      margin: BubbleEdges.all(8),
                      nip: BubbleNip.rightBottom,
                      elevation: 0,
                      child: AutoSizeText(
                        '저를 눌러서 \n필요한 기능들을 알려주세요!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 180,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  _write();
                },
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 300,
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
            height: MediaQuery.of(context).size.height * 0.47,
            color: Colors.grey[300],
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
                      child: Center(
                        child: Text(
                          '건의사항 목록',
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(phoneBookView());
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
                      child: Center(
                        child: Text(
                          '전화번호부',
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
