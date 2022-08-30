// TODO: 設定画面を作製する
// TODO: サインアウトできるようにする

import 'package:flutter/material.dart';

import '../Assignment/Assignment.dart';
import '../Assignment/Calendar.dart';
import '../HomePage/Main_screen.dart';
import '../Timer/TimerPage.dart';
import 'BottomBar.dart';
import 'Main_screen.dart';

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
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}