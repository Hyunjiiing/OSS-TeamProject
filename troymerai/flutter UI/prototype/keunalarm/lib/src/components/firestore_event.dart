// 이 페이지는 파이어스토어 데이터베이스에서 데이터를 불러오고 그것을 실시간으로 새로고침하여 listview를 만들어주는 역할을 하는 페이지입니다!

//팀원들이 크롤링에 성공하면 class fireStoreEvent >>> class popularEvent ... 등으로 바꿔서 각각의 클래스에서 데이터를 받아온 뒤, 각각의 tabmenu페이지
//에서는 클래스만 붙여주기로!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/pages/event_page.dart';

class fireStoreEvent extends StatefulWidget {
  const fireStoreEvent({super.key});

  @override
  State<fireStoreEvent> createState() => _fireStoreEventState();
}

class _fireStoreEventState extends State<fireStoreEvent> {
  /**파이어베이스 데이터베이스에 저장된 컬렉션 이름을 불러올 수 있게 함 */
  CollectionReference event = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: event.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return
                    /** 이게 공지사항 페이지에 있는 박스 >>> 디자인은 여기서 바꿔야 함 */
                    Card(
                  margin: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 8,
                    bottom: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(eventPage1());
                    },
                    child: ListTile(
                      // 아직 데이터 2개종류 넣는 방법밖에 못찾음, 더 검색해봐야함
                      title: Text(documentSnapshot['schedule']),
                      subtitle: Text(documentSnapshot['start_date']),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
