import 'package:flutter/material.dart';
import 'package:cccapp_code/src/HomePage/BottomBar.dart';
import 'package:cccapp_code/src/HomePage/Main_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mori.jpeg'),
              fit: BoxFit.cover,
            )),
        child: Column(
          children: const <Widget>[
            main_screen(),
          ],
        ),
      ),//
      bottomNavigationBar: const BottomBar(),
    );
  }
}