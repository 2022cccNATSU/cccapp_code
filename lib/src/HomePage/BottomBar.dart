//TODO: UIを整えてください！
import 'package:flutter/material.dart';
import 'package:cccapp_code/src/Assignment/Calendar.dart';
import 'package:cccapp_code/src/Assignment/Assignment.dart';

const Color BottomBarHomeColor = Colors.cyan;//下のバーのホーム色
const Color BottomBarCalenderColor = Colors.purpleAccent;//下のバーのカレンダーの色
const Color BottomBarAssignmentColor = Colors.teal;//下のバーの課題の色
const Color BottomBarTimerColor = Colors.black54;//下のバーのタイマーの色
const Color BottomBarTextColor = Colors.green;//下のバーのテキストの色

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends  State<BottomBar>{
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Calender()));
      }
      else if(_selectedIndex==1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Assingment()));
      }
      else if(_selectedIndex==2){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
      }
      else if(_selectedIndex==3){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,//bottombarを透明にしない場合は下1行と合わせて消す
      elevation: 0,//
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home_filled),
          label: 'Home',
          //backgroundColor: BottomBarHomeColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          activeIcon: Icon(Icons.calendar_month_outlined),
          label: 'Calendar',
          //backgroundColor:BottomBarCalenderColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          activeIcon: Icon(Icons.assessment_outlined),
          label: 'Assignment',
          //backgroundColor: BottomBarAssignmentColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          activeIcon: Icon(Icons.timer),
          label: 'Timer',
          //backgroundColor: BottomBarTimerColor,
        ),
      ],
      enableFeedback: true,
      iconSize: 25,
      selectedFontSize: 20,
      selectedLabelStyle: const TextStyle(fontFamily: 'FredokaOne'),
      selectedIconTheme: const IconThemeData(size: 30,color: BottomBarTextColor,),
    );
  }
}