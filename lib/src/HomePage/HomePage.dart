// TODO: 設定画面を作製する
// TODO: サインアウトできるようにする

import 'package:flutter/material.dart';

import 'package:cccapp_code/src/Assignment/Assignment.dart';
import 'package:cccapp_code/src/Assignment/Calendar.dart';
import 'package:cccapp_code/src/HomePage/Main_screen.dart';
import 'package:cccapp_code/src/Timer/TimerPage.dart';
import 'BottomBar.dart';

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
        extendBody: true,
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