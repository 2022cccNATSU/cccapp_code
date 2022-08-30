// TODO: 設定画面を作製する
// TODO: サインアウトできるようにする

import 'package:flutter/material.dart';

import '../HomePage/Main_screen.dart';
import '../Assignment/Assignment.dart';
import '../Assignment/Calendar.dart';
import '../../widget/Constants.dart';
import '../Timer/TimerPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageViewController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            _pageViewController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut);
          },
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: 'Home',
              backgroundColor: bottomBarHomeColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              activeIcon: Icon(Icons.calendar_month_outlined),
              label: 'Calender',
              backgroundColor: bottomBarCalenderColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              activeIcon: Icon(Icons.assessment_outlined),
              label: 'Assignment',
              backgroundColor: bottomBarAssignmentColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              activeIcon: Icon(Icons.timer),
              label: 'Timer',
              backgroundColor: bottomBarTimerColor,
            ),
          ],
          enableFeedback: true,
          iconSize: 25,
          selectedFontSize: 25,
          selectedIconTheme: const IconThemeData(size: 30, color: bottomBarTextColor),
        ),
      ),
    );
  }
}