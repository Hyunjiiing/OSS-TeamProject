import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firestoreSuggestionView extends StatefulWidget {
  const firestoreSuggestionView({super.key});

  @override
  State<firestoreSuggestionView> createState() =>
      _firestoreSuggestionViewState();
}

class _firestoreSuggestionViewState extends State<firestoreSuggestionView> {
  CollectionReference suggestionview =
      FirebaseFirestore.instance.collection('suggestion');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: suggestionview.snapshots(),
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

                    Container(
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
                  child: ListTile(
                    // 아직 데이터 2개종류 넣는 방법밖에 못찾음, 더 검색해봐야함
                    title: Text(documentSnapshot['suggestion']),
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
