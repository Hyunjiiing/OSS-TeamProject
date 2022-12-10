import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../components/color.dart';

class Event {
  String title;
  Event(this.title);

  @override
  String toString() => title;
}

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
    final events = LinkedHashMap(
      equals: isSameDay,
    )..addAll(graduate_eventSource);

    List<String> get_graduate_Events_ForDay(DateTime day) {
      return events[day] ?? [];
    }

    return Scaffold(
      backgroundColor: HexColor("#f0fafc"),
      appBar: AppBar(
        backgroundColor: HexColor("#f0fafc"),
        title: Center(
            child: Text(
          '학사일정',
          style: TextStyle(
              fontSize: 25, fontFamily: "NanumEB", fontWeight: FontWeight.bold),
        )),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TableCalendar(
              headerStyle: HeaderStyle(
                titleCentered: true,
                leftChevronVisible: true,
                rightChevronVisible: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(fontSize: 25, fontFamily: "NanumB"),
              ),
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: focusedDay,
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                // 선택된 날짜의 상태를 갱신합니다.
                setState(() {
                  _selectedDay = selectedDay;
                  this.selectedDay = selectedDay;
                  this.focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (DateTime day) {
                return isSameDay(selectedDay, day);
              },
              calendarStyle: CalendarStyle(
                selectedTextStyle: const TextStyle(
                  fontSize: 16.0,
                ),

// selectedDay 모양 조정
                selectedDecoration: const BoxDecoration(
                  color: Color.fromARGB(151, 0, 151, 189),
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                isTodayHighlighted: true,

// today 글자 조정
                todayTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 14, 13, 13),
                  fontSize: 16.0,
                ),

// today 모양 조정
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(38, 0, 151, 189),
                  shape: BoxShape.circle,
                ),
                weekendTextStyle:
                    const TextStyle(color: Color.fromARGB(255, 100, 90, 230)),

// weekend 모양 조정
                weekendDecoration: const BoxDecoration(shape: BoxShape.circle),
              ),
              eventLoader: (day) {
                return get_graduate_Events_ForDay(day);
              },
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: get_graduate_Events_ForDay(_selectedDay)
                .map((event) => ListTile(
                      title: Text(
                        event.toString(),
                        style: TextStyle(fontFamily: "NanumB"),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
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
      .collection('Calendar_undergraduate')
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
