// 이 페이지는 파이어스토어 데이터베이스에서 데이터를 불러오고 그것을 실시간으로 새로고침하여 listview를 만들어주는 역할을 하는 페이지입니다!

//팀원들이 크롤링에 성공하면 class fireStoreEvent >>> class popularEvent ... 등으로 바꿔서 각각의 클래스에서 데이터를 받아온 뒤, 각각의 tabmenu페이지
//에서는 클래스만 붙여주기로!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:keunalarm/src/pages/event_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late int storage;
List<int> indexstorage = [];

class fireStoreEvent extends StatefulWidget {
  fireStoreEvent({super.key});
  @override
  State<fireStoreEvent> createState() => _fireStoreEventState();
}

late String refresh;
CollectionReference event = FirebaseFirestore.instance.collection('events');
late DocumentReference likesRef;
late String uid;
bool isLiked = false;
int count = 0;
late Map<String, dynamic> data;

class _fireStoreEventState extends State<fireStoreEvent> {
  /**파이어베이스 데이터베이스에 저장된 컬렉션 이름을 불러올 수 있게 함 */
  CollectionReference event = FirebaseFirestore.instance.collection('events');
  CollectionReference likelist =
      FirebaseFirestore.instance.collection('likelist');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: event.snapshots(),
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
                          /*
                          trailing: IconButton(onPressed: () async {
                            setState(() {});
                          }),
                          */
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

  _isLikedFunc() {
    setState(() {});
  }

/*

// sharedpreferrence 써서 좋아요 기능 구현하려고 했지만, 일단 보류

  late bool liked;
  late int text;
  late int input;
  late int testindex;
  late CollectionReference event;
 
  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
    /**파이어베이스 데이터베이스에 저장된 컬렉션 이름을 불러올 수 있게 함 */
    event = FirebaseFirestore.instance.collection(widget.code);
  }

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var liked = preferences.getBool('testindex') ?? false;
    setState(() => this.liked = liked);
  }

  void _persistPreference() async {
    setState(() => liked = !liked);
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool('testindex', liked);
  }
  //

  Widget dfd(DocumentSnapshot documentSnapshot) {
    return ListTile(
      // 아직 데이터 2개종류 넣는 방법밖에 못찾음, 더 검색해봐야함
      title: Text(documentSnapshot['schedule']),
      subtitle: Text(documentSnapshot['start_date']),
      trailing: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          _persistPreference();
          indexstorage.add(storage);
        });
      },
    );
  }

//좋아요한 리스트만 보여주는 위젯
  Widget eventLikePage(DocumentSnapshot documentSnapshot) {
    return ListView.builder(
      itemCount: indexstorage.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: ListTile(
          // 아직 데이터 2개종류 넣는 방법밖에 못찾음, 더 검색해봐야함
          title: Text(documentSnapshot['schedule']),
          subtitle: Text(documentSnapshot['start_date']),
          trailing: Icon(
            liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              _persistPreference();
              indexstorage.add(storage);
            });
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream: event.snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return ListView.separated(
            itemCount: streamSnapshot.data!.docs.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
              return Container(
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
                child: Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(eventPage1());
                    },
                    child: dfd(documentSnapshot),
                  ),
                ),
              );
            },
          );
        }
        ;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

*/
}
