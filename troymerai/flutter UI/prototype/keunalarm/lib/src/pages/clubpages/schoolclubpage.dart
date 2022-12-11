import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/color.dart';

class schoolClubPage extends StatelessWidget {
  schoolClubPage({super.key});

  CollectionReference club = FirebaseFirestore.instance.collection('club');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f0fafc"),
      appBar: AppBar(
        backgroundColor: HexColor("#f0fafc"),
        elevation: 0,
        leadingWidth: 0,
        title: Center(
            child: Text(
          '중앙 동아리',
          style: TextStyle(fontSize: 25, fontFamily: "NanumEB"),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '  동아리명 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 20,
                                    child: AutoSizeText(
                                      documentSnapshot['동아리명'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '  대표학생 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 20,
                                    child: AutoSizeText(
                                      documentSnapshot['대표학생'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '         목표 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 20,
                                    child: AutoSizeText(
                                      documentSnapshot['목표'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '  지도교수 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 20,
                                    child: AutoSizeText(
                                      documentSnapshot['지도교수 성명'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '         학과 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 20,
                                    child: AutoSizeText(
                                      documentSnapshot['지도교수 학과'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    height: 25,
                                    child: Center(
                                        child: Text(
                                      '     회원수 :',
                                      style: TextStyle(
                                          fontFamily: "NanumEB", fontSize: 20),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.68,
                                    height: 18,
                                    child: AutoSizeText(
                                      documentSnapshot['회원수'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontFamily: "NanumB"),
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
