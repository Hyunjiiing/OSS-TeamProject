import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class schoolClubPage extends StatelessWidget {
  schoolClubPage({super.key});

  CollectionReference club = FirebaseFirestore.instance.collection('club');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Center(
            child: Text(
          '중앙 동아리',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
      body: StreamBuilder(
          stream: club.snapshots(),
          builder: (BuildContext context, AsyncSnapshot streamsnapshot) {
            if (streamsnapshot.hasData) {
              return ListView.builder(
                itemCount: streamsnapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final DocumentSnapshot documentSnapshot =
                      streamsnapshot.data!.docs[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child: Center(child: AutoSizeText('동아리명')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['동아리명'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child: Center(child: AutoSizeText('대표학생')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['대표학생'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child: Center(child: AutoSizeText('목표')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['목표'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child:
                                        Center(child: AutoSizeText('지도교수 성명')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['지도교수 성명'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child:
                                        Center(child: AutoSizeText('지도교수 학과')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['지도교수 학과'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 25,
                                    child: Center(child: AutoSizeText('회원수')),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.73,
                                    height: 25,
                                    child: AutoSizeText(
                                      documentSnapshot['회원수'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
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
                },
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
