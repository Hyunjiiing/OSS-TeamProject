import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CollectionReference likelist =
      FirebaseFirestore.instance.collection('likelist');

  bool isLike = false;
  final TextEditingController scheduleController = TextEditingController();
  final TextEditingController startdateController = TextEditingController();

  void setLikeSystem(bool isLike) {
    this.isLike = isLike;
  }

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    scheduleController.text = documentSnapshot['schedule'];
    startdateController.text = documentSnapshot['start_date'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: likelist.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.separated(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return
                      /** 이게 공지사항 페이지에 있는 박스 >>> 디자인은 여기서 바꿔야 함 */

                      Container(
                    margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
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
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(eventPage1());
                        },
                        child: ListTile(
                          // 아직 데이터 2개종류 넣는 방법밖에 못찾음, 더 검색해봐야함
                          title: Text(documentSnapshot['schedule']),
                          subtitle: Text(documentSnapshot['start_date']),
                          trailing: IconButton(
                            onPressed: () async {
                              setState(() {
                                isLike = !isLike;
                              });

                              final String schedule = scheduleController.text;
                              final String start_date =
                                  startdateController.text;

                              likelist.doc(documentSnapshot.id).update({
                                "schedule": schedule,
                                "start_date": start_date
                              });
                              scheduleController.text = "";
                              startdateController.text = "";
                            },
                            icon: Icon(
                              isLike ? Icons.bookmark : Icons.bookmark_border,
                              color: isLike ? Colors.red : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
