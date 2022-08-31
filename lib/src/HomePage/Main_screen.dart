//import 'dart:io';
//import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:cccapp_code/src/HomePage/commentsInHP.dart';
import 'package:cccapp_code/src/HomePage/FairyImagesInHP.dart';

import '../../widget/Constants.dart';
import 'Settings.dart';

class TopBar extends StatelessWidget {
  final int point = 0;

  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Material(
        color: topBarColor,
        elevation: 24,
        shadowColor: topBarColorShadow,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
            top: 30,
            bottom: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.diamond,
                    color: diamondColor,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '$point',
                    style: const TextStyle(
                      color: topBarTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  Expanded(
                    child: InkWell(
                      child: const Icon(
                        Icons.settings,
                        color: topBarTextColor,
                        size: 25,
                      ),
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (
                                  BuildContext context) => const Settings()));
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FailyImage extends StatefulWidget {
  const FailyImage({Key? key}) : super(key: key);


  @override
  State<FailyImage> createState() => _FailyImageState();
}

class _FailyImageState extends State<FailyImage> {
  var rand = math.Random();
  int _counter1 = 0;
  int _counter2 = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _counter1 = rand.nextInt(7);
              _counter2 = rand.nextInt(3);
              print('image change to $_counter1');
              print('comment change to $_counter2');
            });
          },
          child: Stack(
              children: [
                Image.asset('assets/images/smile1.png'),
                images(_counter1),
              ]
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: 155,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            color: Colors.grey[100],
          ),
          child: Text(comments(_counter1, _counter2),
            style: const TextStyle(fontFamily: 'Yomogi', fontSize: 20),),
          //child: DefaultTextStyle(
          //  style: const TextStyle(
          //    color: Colors.black87,
          //    fontSize: 15,
          //    //fontFamily:,
          //  ),
          //  child: AnimatedTextKit(
          //      isRepeatingAnimation: false,
          //      animatedTexts: [
          //        comments(),
          //     ],
          //      onTap:(){},
          //  ),
          //),
        ),
      ],
    );
  }
}


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mori.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: const <Widget>[
          TopBar(),
          SizedBox(height: 100),
          FailyImage(),
        ],
      ),
    );
  }
}
