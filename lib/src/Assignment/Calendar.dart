import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bubble/bubble.dart';
import 'package:cccapp_code/src/Assignment/FairyImagesInCalendar.dart';
//import 'package:cccapp_code/widget/Fukidashi.dart';
import 'package:cccapp_code/src/Assignment/commentsInCalendar.dart';




const Color FrameColor = Color.fromRGBO(180, 255, 255, 1.0); //妖精コメントの色

DateTime _focusedDay = DateTime.now();//エミュレーターでの時刻設定に準拠しているので注意
DateTime? _selectedDay;//タップで選択したやつ
CalendarFormat _calendarFormat = CalendarFormat.month;//右上のやつ
Map<DateTime, List> _eventsList = {};//予定
class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);
  @override
  State<Calender> createState() => _Calender();
}

class _Calender extends State<Calender> {
  int monthNow=_focusedDay.month;
  int dayNow=_focusedDay.day;
  int hourNow=_focusedDay.hour;
  int? Selectedyear=_selectedDay?.year;
  int? Selectedmonth=_selectedDay?.month;
  int? Selectedday=_selectedDay?.day;


  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    //サンプルのイベントリスト
    _eventsList = {
      DateTime.now().subtract(const Duration(days: 2)): ['Event A6', 'Event B6'],
      DateTime.now(): ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      DateTime.now().add(const Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      DateTime.now().add(const Duration(days: 3)):
      {'Event A9', 'Event B9', 'Event C9'}.toList(),
      DateTime.now().add(const Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      DateTime.now().add(const Duration(days: 11)): ['Event A11', 'Event B11'],
      DateTime.now().add(const Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      DateTime.now().add(const Duration(days: 22)): ['Event A13', 'Event B13'],
      DateTime.now().add(const Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };
  }

  @override
  Widget build(BuildContext context) {

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_eventsList);


    List getEventForDay(DateTime day) {
      return _events[day] ?? [];
    }

    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Colors.blue,
            alignment: Alignment.centerRight,
            //child: ElevatedButton(
            //    style: ElevatedButton.styleFrom(
            //      primary: Colors.white,
            //    ),
            //    child: const Text('予定を追加',style: TextStyle(color: Colors.black),),
            //    onPressed:(){}
            //),
          ),
          //カレンダーのウィジェット
          Container(
            color: Colors.white,
            child: TableCalendar(
              firstDay: DateTime.utc(_focusedDay.year-1, 1, 1),
              lastDay: DateTime.utc(_focusedDay.year+3, 12, 31),
              focusedDay: _focusedDay,
              eventLoader: getEventForDay,
              calendarFormat: _calendarFormat,
              pageJumpingEnabled: true,
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    return const Center(
                      child: Text(
                        'Sun',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }else if (day.weekday == DateTime.saturday) {
                    return const Center(
                      child: Text(
                        'Sat',
                        style: TextStyle(color: Colors.blue),
                      ),
                    );
                  }
                },
              ),
              onFormatChanged: (format) {// フォーマット変更のボタンをしたときの処理
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              selectedDayPredicate: (day) {//タップで選択したときの処理
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin:FractionalOffset.topCenter,end: FractionalOffset.bottomCenter,colors: [Colors.blue,Colors.white])
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //妖精のコメントのフレームのプログラム
                    SizedBox(
                      width: MediaQuery.of(context).size.width-150,
                      child: Bubble(
                        margin: const BubbleEdges.only(top: 0),
                        nip: BubbleNip.rightBottom,
                        padding: const BubbleEdges.all(10),
                        color: FrameColor,
                        child: Text(comments(monthNow,dayNow,hourNow), textAlign: TextAlign.left,style: const TextStyle(fontFamily: 'Yomogi'),),
                      ),
                    ),
                    //妖精のプログラム
                    Container(
                      height: 180,
                      width: 150,
                      alignment: Alignment.bottomCenter,
                      child: images(monthNow,dayNow,hourNow),
                    ),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10,right: 10,left: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10,left: 10),
                          child: Text(text(_focusedDay,_selectedDay),style: const TextStyle(fontSize: 20),)
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: getEventForDay(_selectedDay!).map((event) => ListTile(
                            title: Text(event.toString()),
                          ))
                              .toList(),
                        )
                      ],
                    ),

                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
  String text(DateTime focusedDay, DateTime? selectedDay) {
    int? selectedyear=selectedDay?.year;
    int? selectedmonth=selectedDay?.month;
    int? selectedday=selectedDay?.day;
    int forcusedyear=focusedDay.year;
    int forcusedmonth=focusedDay.month;
    int forcusedday=focusedDay.day;
    if(selectedDay?.year!=null&&selectedDay?.month!=null&&selectedDay?.day!=null){
      return ('$selectedyear年$selectedmonth月$selectedday日の予定');
    }else{
      return ('$forcusedyear年$forcusedmonth月$forcusedday日の予定');
    }
  }
}
