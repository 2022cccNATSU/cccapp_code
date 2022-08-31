import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bubble/bubble.dart';
import 'package:cccapp_code/src/Assignment//FairyImagesInCalendar.dart';
//import 'package:cccapp_code/widget/Fukidashi.dart';
import 'package:cccapp_code/src/Assignment/commentsInCalendar.dart';

const Color FrameColor = Color.fromRGBO(180, 255, 255, 1.0); //妖精コメントの色

DateTime _focusedDay = DateTime.now();//エミュレーターでの時刻設定に準拠しているので注意

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);
  @override
  State<Calender> createState() => _Calender();
}

class _Calender extends State<Calender> {
  int monthNow=_focusedDay.month;
  int dayNow=_focusedDay.day;
  int hourNow=_focusedDay.hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender'),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          //カレンダーのウィジェット
          TableCalendar(
            firstDay: DateTime.utc(2022, 4, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: _focusedDay,
          ),
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
                height: 200,
                width: 150,
                alignment: Alignment.bottomCenter,
                child: images(monthNow,dayNow,hourNow),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
