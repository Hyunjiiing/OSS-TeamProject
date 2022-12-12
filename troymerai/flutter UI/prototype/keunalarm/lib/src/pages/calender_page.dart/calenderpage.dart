import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:keunalarm/src/components/firestore_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import '../../components/color.dart';

class Event {
  String title;
  Event(this.title);

  @override
  String toString() => title;
}

int count = 0;

List<Color> c = [Colors.red, Colors.blue];

List<String> Events = [];
List<dynamic> Dates = [];
Map<DateTime, dynamic> eventSource = {};

List<String> graduate_Events = [];
List<dynamic> graduate_Dates = [];
List<String> under_graduate_Events = [];
List<dynamic> under_graduate_Dates = [];

Map<DateTime, dynamic> graduate_eventSource = {};
Map<DateTime, dynamic> under_graduate_eventSource = {};
DateTime _selectedDay = DateTime.now();

class TableCalendarScreen extends StatefulWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);

  @override
  State<TableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<TableCalendarScreen> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    getData();
    getCalendarData();

    final graduate_events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(graduate_eventSource);

    List<String> get_graduate_Events_ForDay(DateTime day) {
      if (graduate_events[day] != null) {
        return graduate_events[day] ?? [];
      } else {
        return [
          "오늘은 일정이 없습니다.",
        ];
      }
    }

    final under_graduate_events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(under_graduate_eventSource);

    List<String> get_under_graduate_Events_ForDay(DateTime day) {
      if (under_graduate_events[day] != null) {
        return under_graduate_events[day] ?? [];
      } else {
        return [
          "오늘은 일정이 없습니다.",
        ];
      }
    }

    final events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(eventSource);

    List<String> get_Events_ForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#f0fafc"),
          title: Center(
              child: Text(
            '학사일정',
            style: TextStyle(
                fontSize: 25,
                fontFamily: "NanumEB",
                fontWeight: FontWeight.bold),
          )),
          elevation: 0,
        ),
        body: Container(
          color: HexColor("#f0fafc"),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.48,
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TableCalendar(
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      weekendStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Color(0xff30384c),
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Color(0xff30384c),
                      )),
                  firstDay: DateTime.utc(2022, 1, 1),
                  lastDay: DateTime.utc(2023, 12, 31),
                  focusedDay: focusedDay,
                  onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      this.selectedDay = selectedDay;
                      this.focusedDay = focusedDay;
                    });
                  },
                  selectedDayPredicate: (DateTime day) {
                    return isSameDay(selectedDay, day);
                  },
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (BuildContext context, date, events) {
                      if (events.isEmpty) return SizedBox();
                      if (count == 2) count = 0;
                      if (events.length == 2) {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  // height: 7,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: c[count++]),
                                ),
                              );
                            });
                      } else if (get_graduate_Events_ForDay(date)
                          .contains(events[0].toString())) {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  // height: 7,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.pink),
                                ),
                              );
                            });
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  // height: 7,
                                  width: 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                ),
                              );
                            });
                      }
                    },
                  ),
                  eventLoader: (day) {
                    return get_Events_ForDay(day);
                  },
                ),
              ),
              Container(
                color: HexColor("#f0fafc"),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.30,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                        // padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
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
                            border: Border(
                              top: BorderSide(
                                color: Colors.red,
                                width: 5,
                              ),
                            )),
                        child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          children:
                              get_under_graduate_Events_ForDay(_selectedDay)
                                  .map((event) => ListTile(
                                        title: Text(event.toString()),
                                      ))
                                  .toList(),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),

                          // padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
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
                            border: Border(
                                top: BorderSide(color: Colors.blue, width: 5)),
                          ),
                          child: ListView(
                            primary: false,
                            shrinkWrap: true,
                            children: get_graduate_Events_ForDay(_selectedDay)
                                .map((event) => ListTile(
                                      title: Text(event.toString()),
                                    ))
                                .toList(),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

Future getCalendarData() async {
  List<dynamic> Documents = [];
  //대학원 데이터 읽기
  var db = await FirebaseFirestore.instance
      .collection('Calendar')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Documents.add(doc.data()); //모든 document 정보를 리스트에 저장.
            }),
            Events = querySnapshot.docs
                .map((doc) => doc['content'].toString())
                .toList(),
            Dates = querySnapshot.docs
                .map((doc) => doc['start_date'].toDate())
                .toList(),
          });
  for (int i = 0; i < Events.length; i++) {
    try {
      if (eventSource[Dates[i]] < 1) {
        if (eventSource[Dates[i]] != Events[i]) {
          eventSource[Dates[i]]!.add(Events[i]);
        }
      }
    } catch (e) {
      eventSource[Dates[i]] = [Events[i]];
    }
  }
  List<DateTime> tempDates = [];
  List<List> tempLists = [];
  eventSource.forEach(((key, value) => eventSource[key] = value.toSet()));
  eventSource.forEach(((key, value) => eventSource[key] = value.toList()));
  eventSource.forEach(((key, value) {
    if (key.second == 1) {
      DateTime temp = key;

      temp = temp.add(Duration(seconds: -1));
      print(value);
      tempDates.add(temp);
      tempLists.add(value);
    }
  }));
  print(tempDates.length);
  print(eventSource[DateTime(2022, 4, 18)]);
  for (int i = 0; i < tempDates.length; i++) {
    try {
      if (eventSource[tempDates[i]][0] != tempLists[i][0]) {
        eventSource[tempDates[i]].add(tempLists[i][0]);
      }
    } catch (e) {
      eventSource[tempDates[i]] = tempLists[i];
    }
    print(eventSource[tempDates[i]]);
  }
}

Future getData() async {
  List<dynamic> Documents = [];
  //학부 데이터 읽기
  var db_undergraduate = await FirebaseFirestore.instance
      .collection('Calendar_undergraduate')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Documents.add(doc.data()); //모든 document 정보를 리스트에 저장.
            }),
            under_graduate_Events = querySnapshot.docs
                .map((doc) => doc['content'].toString())
                .toList(),
            under_graduate_Dates = querySnapshot.docs
                .map((doc) => doc['start_date'].toDate())
                .toList(),
          });
  for (int i = 0; i < under_graduate_Events.length; i++) {
    try {
      if (under_graduate_eventSource[under_graduate_Dates[i]] !=
          under_graduate_Events[i]) {
        under_graduate_eventSource[under_graduate_Dates[i]]!
            .add(under_graduate_Events[i]);
      }
    } catch (e) {
      under_graduate_eventSource[under_graduate_Dates[i]] = [
        under_graduate_Events[i]
      ];
    }
  }
  under_graduate_eventSource.forEach(
      ((key, value) => under_graduate_eventSource[key] = value.toSet()));
  under_graduate_eventSource.forEach(
      ((key, value) => under_graduate_eventSource[key] = value.toList()));

  //대학원 데이터 읽기
  var db_graduate = await FirebaseFirestore.instance
      .collection('Calendar_graduate')
      .get()
      .then((QuerySnapshot querySnapshot) => {
            querySnapshot.docs.forEach((doc) {
              Documents.add(doc.data()); //모든 document 정보를 리스트에 저장.
            }),
            graduate_Events = querySnapshot.docs
                .map((doc) => doc['content'].toString())
                .toList(),
            graduate_Dates = querySnapshot.docs
                .map((doc) => doc['start_date'].toDate())
                .toList(),
          });
  for (int i = 0; i < graduate_Events.length; i++) {
    try {
      if (graduate_eventSource[graduate_Dates[i]] != graduate_Events[i]) {
        graduate_eventSource[graduate_Dates[i]]!.add(graduate_Events[i]);
      }
    } catch (e) {
      graduate_eventSource[graduate_Dates[i]] = [graduate_Events[i]];
    }
  }
  graduate_eventSource
      .forEach(((key, value) => graduate_eventSource[key] = value.toSet()));
  graduate_eventSource
      .forEach(((key, value) => graduate_eventSource[key] = value.toList()));
}
