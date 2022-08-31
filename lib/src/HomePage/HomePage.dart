// TODO: 設定画面を作製する
// TODO: サインアウトできるようにする

import 'package:flutter/material.dart';

import 'package:cccapp_code/src/Assignment/Assignment.dart';
import 'package:cccapp_code/src/Assignment/Calendar.dart';
import 'package:cccapp_code/src/HomePage/Main_screen.dart';
import 'package:cccapp_code/src/Timer/TimerPage.dart';
//import 'BottomBar.dart';

const Color BottomBarHomeColor = Colors.indigo;//下のバーのホーム色
const Color BottomBarCalenderColor = Colors.blue;//下のバーのカレンダーの色
const Color BottomBarAssignmentColor = Colors.lightBlueAccent;//下のバーの課題の色
const Color BottomBarTimerColor = Colors.cyan;//下のバーのタイマーの色
const Color BottomBarTextColor = Colors.lightGreenAccent;//下のバーのテキストの色

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageViewController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: '',)));
      }
      else if(_selectedIndex==1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Calender()));
      }
      else if(_selectedIndex==2){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Assingment()));
      }
      else if(_selectedIndex==3){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },//
      child: Scaffold(
        body: PageView(
          controller: _pageViewController,
          children: const <Widget>[
            MainScreen(),
            Calender(),
            Assingment(),
            TimerPage(),
          ],
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: 90,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.bottomRight,
                colors: [Colors.indigo,Colors.indigo,Colors.blue,Colors.blue,Colors.lightBlueAccent,Colors.lightBlueAccent,Colors.cyan,Colors.cyan]
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items:  const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                  backgroundColor: BottomBarHomeColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  activeIcon: Icon(Icons.calendar_month_outlined),
                  label: 'Calendar',
                  backgroundColor:BottomBarCalenderColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assessment),
                  activeIcon: Icon(Icons.assessment_outlined),
                  label: 'Assignment',
                  backgroundColor: BottomBarAssignmentColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer),
                  activeIcon: Icon(Icons.timer),
                  label: 'Timer',
                  backgroundColor: BottomBarTimerColor,
                ),
              ],
              enableFeedback: true,
              iconSize: 25,
              selectedFontSize: 20,
              selectedLabelStyle: const TextStyle(fontFamily: 'FredokaOne'),
              selectedIconTheme: const IconThemeData(size: 30,color: BottomBarTextColor,),
            ),
          ),
        ),
      ),
    );
  }
}