import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:bubble/bubble.dart';
import 'package:cccapp_code/src/Assignment/FairyImagesInCalendar.dart';
//import 'package:cccapp_code/widget/Fukidashi.dart';
import 'package:cccapp_code/src/Assignment/commentsInCalendar.dart';




const Color FrameColor = Color.fromRGBO(180, 255, 255, 1.0); //妖精コメントの色

DateTime _focusedDay = DateTime.now();//エミュレーターでの時刻設定に準拠しているので注意
DateTime _selectedDay = DateTime.now();//タップで選択したやつ
CalendarFormat _calendarFormat = CalendarFormat.month;//右上のやつ
Map<DateTime, List> _eventsList = {};//予定
String yotei = ('');

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);
  @override
  State<Calender> createState() => _Calender();
}

class _Calender extends State<Calender> {
  int monthNow=_focusedDay.month;
  int dayNow=_focusedDay.day;
  int hourNow=_focusedDay.hour;
  int? Selectedyear=_selectedDay.year;
  int? Selectedmonth=_selectedDay.month;
  int? Selectedday=_selectedDay.day;


  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    //サンプルのイベントリスト
    _eventsList = {
      DateTime.now().subtract( const Duration(days: 2)): ['Event A6', 'Event B6'],
      DateTime.now(): ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      DateTime.now().add( const Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      DateTime.now().add( Duration(days: 3)):
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
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: const Text('予定を追加',style: TextStyle(color: Colors.black87),),
                onPressed:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddEvent()));
                }
            ),
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
                        child: Text(comments(monthNow,dayNow,hourNow), textAlign: TextAlign.left,style: const TextStyle(fontFamily: 'Yomogi',color: Colors.black87),),
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
                          child: Text('${text()}の予定',style: const TextStyle(fontSize: 20,color: Colors.black87),)
                        ),
                        ListView(
                          shrinkWrap: true,
                            children: getEventForDay(_selectedDay).map((event) => ListTile(
                            title: Text(event.toString(),style: const TextStyle(color: Colors.black87),),
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
}

String text() {
  return ('${_selectedDay.year}年${_selectedDay.month}月${_selectedDay.day}日');
}

const Color ThemeColor = Color(0xFFFE7C64);//テーマカラー
const Color BackGroundColor = Color(0xFF19283D);//背景の色
const Color TextColor = Color(0xFFB0BEC5);//全体のテキストの色
const Color OnClickButtonColor = Color(0xFFFE7C64);//ボタンがクリックされたときの枠の色
const Color DecisionButtonTextColor = Colors.black87;//決定ボタンのテキストの色

class AddEvent extends StatelessWidget {
  const AddEvent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: InputPage(),
    );
  }
}

class InputPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackGroundColor,
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputForm(),
            ],
          ),
        )
    );
  }
}

class SelectSubject extends StatefulWidget {
  const SelectSubject({Key? key}) : super(key: key);

  @override
  State<SelectSubject> createState() => _SelectSubject();
}

class  _SelectSubject extends State<SelectSubject> {

  @override
  Widget build(BuildContext context) {

    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child:Text('選択中：${text()}',style: const TextStyle(fontSize: 30,color: TextColor),)
    );

  }

}

class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const _CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: TextColor),
        hintText: hintText,
        hintStyle: const TextStyle(color: TextColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: OnClickButtonColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: TextColor,
          ),
        ),
      ),
      obscureText: obscureText,
      onChanged: (value){
        yotei=value;
      },
    );
  }
}

//日付、内容、決定のボタン
class InputForm extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SelectSubject(),
        const SizedBox(height: 48),
        const _CustomTextField(
          labelText: '予定',
          hintText: '予定を入力してください',
          obscureText: false,
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: TextColor,
              backgroundColor: TextColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              if(_eventsList[_selectedDay]==null){
                print('$yotei(null)'); //yoteiはTextFieldでとってきたやつ
                _eventsList[_selectedDay]=[yotei];
                print(_eventsList);
              }else{
                print('$yotei(not null)');
                _eventsList[_selectedDay]?.add(yotei);
                print(_eventsList);
              }
            },
            child: Text(
              '追加',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: DecisionButtonTextColor, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: TextColor,
              backgroundColor: TextColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Calender()));
            },
            child: Text(
              'カレンダーに戻る',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: DecisionButtonTextColor, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}