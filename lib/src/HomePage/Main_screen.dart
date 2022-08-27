//import 'dart:io';
//import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cccapp_code/src/HomePage/commentsInHP.dart';
import 'package:cccapp_code/src/HomePage/FairyImagesInHP.dart';


const Color TopBarColor = Colors.black54;//上のバーの色
const Color TopBarColorShadow = Colors.black26;//上のバーの影の色
const Color DiamondColor = Colors.indigoAccent;//ダイヤの色
const Color TopBarTextColor = Color(0xFFB0BEC5);//上のバーの数字と設定の色

class TopBar extends StatelessWidget{
  final int point = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Material(
        color: TopBarColor,
        elevation: 24,
        shadowColor: TopBarColorShadow,
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
                    color: DiamondColor,
                    size: 25,
                  ),
                  const SizedBox(width: 30,),
                  Text(
                    '$point',
                    style: const TextStyle(
                      color: TopBarTextColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 180,),
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: TopBarTextColor,
                      size: 25,
                    ),
                    onPressed: () {
                      //処理
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class FailyImage extends StatelessWidget{
//  final String image = 'assets/images/faily.png';
//
//  const FailyImage({Key? key}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//   return Padding(
//      padding: const EdgeInsets.only(
//        left: 24,
//        right: 24,
//        top: 30,
//        bottom: 15,
//      ),
//      child: Image.asset(image),
//    );
//  }
//}

class FailyImage extends StatefulWidget {
  const FailyImage({Key? key}) : super(key: key);

  @override
  State<FailyImage> createState() => _FailyImageState();
}

class _FailyImageState extends State<FailyImage>{
  var rand = math.Random();
  int _counter1=0;
  int _counter2=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              _counter1=rand.nextInt(7);
              _counter2=rand.nextInt(3);
              print('image change to $_counter1');
              print('comment change to $_counter2');
            });
          },
          child: Stack(
              children:[
                Image.asset('assets/images/smile1.png'),
                images(_counter1),
              ]
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 155,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            color: Colors.grey[100],
          ),
          child: Text(comments(_counter1,_counter2)),
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



class main_screen extends StatelessWidget{
  const main_screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopBar(),
        const SizedBox(height: 100,),
        const FailyImage(),
      ],
    );
  }
}