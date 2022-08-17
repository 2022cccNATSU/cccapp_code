import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bubble/bubble.dart';
import 'Assignment.dart';

const Color FrameColor = Color.fromRGBO(180, 255, 255, 1.0); //妖精コメントの色

DateTime _focusedDay = DateTime.now();

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _Calender();
}

class _Calender extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Bubble(
                margin: const BubbleEdges.only(top: 0),
                nip: BubbleNip.rightBottom,
                padding: const BubbleEdges.all(50),
                color: FrameColor,
                child: const Text('coment', textAlign: TextAlign.center),
              ),
              //妖精のプログラム
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Task()));
                },
                child: Container(
                  height: 200,
                  width: 150,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/faily.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
