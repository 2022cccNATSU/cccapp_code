//TODO: UIを整えてください！
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:cccapp_code/src/HomePage/BottomBar.dart';

import '../HomePage/HomePage.dart';

class LoginBonus extends StatefulWidget {
  const LoginBonus({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginBonus> createState() => _LoginBonusState();
}

class _LoginBonusState extends State<LoginBonus> {
  int now = 3;

  void showingDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          //title: const Text("タイトル"),
          children: <Widget>[
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/lottie/gift.json"),
            ),
          ],
        );
      },
    );
    await Future.delayed(const Duration(seconds: 2));
    animateWhiteOut();
  }

  void animateWhiteOut() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const Congratulations();
        },
        transitionDuration: const Duration(seconds: 3),
        reverseTransitionDuration: const Duration(seconds: 3),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final color = ColorTween(
            begin: Colors.transparent,
            end: Colors.black, // ブラックアウト
            // end: Colors.white, // ホワイトアウト
          ).animate(CurvedAnimation(
            parent: animation,
            // 前半
            curve: const Interval(
              0.0,
              0.5,
              curve: Curves.easeInOut,
            ),
          ));
          final opacity = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            // 後半
            curve: const Interval(
              0.5,
              1.0,
              curve: Curves.easeInOut,
            ),
          ));
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                color: color.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: child,
                ),
              );
            },
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  if (index == now) {
                    return InkWell(
                      onTap: () {
                        showingDialog();
                      },

                      //margin: const EdgeInsets.only(top:20,bottom:20),
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          children:[
                            Text("${(index + 1).toString()} 日目"),
                            const Icon(Icons.money),
                          ],
                        ),
                      ),
                    );
                  } else if(index > now){
                    return Container(
                      color: Colors.red,
                      //margin: const EdgeInsets.only(top:20,bottom:20),
                      child: Column(
                        children:[
                          Text("${(index + 1).toString()} 日目"),
                          const Icon(Icons.question_mark),
                        ],
                      ),
                    );
                  } else{
                    return Container(
                      color: Colors.red,
                      //margin: const EdgeInsets.only(top:20,bottom:20),
                      child: Column(
                        children:[
                          Text("${(index + 1).toString()} 日目"),
                          const Icon(Icons.close),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Congratulations extends StatefulWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  _Congratulations createState() => _Congratulations();
}

class _Congratulations extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Canterbury',
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  animatedTexts: [
                    ScaleAnimatedText('ログインの報酬！'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(30),
                width: 150,
                height: 150,
                child:
                const Image(image: AssetImage("assets/images/coin.jfif"))),
            const Text("知識ポイントを 5 ポイント獲得しました！"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const MyHomePage(title: 'Kaname',),
                    ),
                  );
                }),
                child: const Text("メイン画面へ"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}