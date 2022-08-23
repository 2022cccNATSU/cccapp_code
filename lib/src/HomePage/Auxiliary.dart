import 'package:flutter/material.dart';
import 'Main_screen.dart';
import 'HomePage.dart';


class Auxiliary extends StatefulWidget {
  const Auxiliary({Key? key,}) : super(key: key);
  @override
  State<Auxiliary> createState() => _Auxiliary();
}

class _Auxiliary extends State<Auxiliary> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BackGround.jpg'),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: <Widget>[
            main_screen(),
          ],
        ),
      ),//
      bottomNavigationBar:  const BottomBar(),
    );
  }
}


