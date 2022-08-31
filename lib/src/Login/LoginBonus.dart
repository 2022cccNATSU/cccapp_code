// TODO: 何日連続でログインしているか記録する
// TODO: ログインボーナスを受け取ったときに知識ポイントを増加する

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

import '../HomePage/HomePage.dart';

//追記BY西尾　使いたいフォント：”LoginBonus Calendar”にDynaPuffのMedium 500　それ以外("メイン画面へ"を除く)にZen Kurenaido
class LoginBonus extends StatefulWidget {
  const LoginBonus({Key? key, required this.title, required this.data})
      : super(key: key);
  final Map<String, dynamic>? data;
  final String title;

  @override
  State<LoginBonus> createState() => _LoginBonusState();
}

class _LoginBonusState extends State<LoginBonus> {
  void showingDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            "Now Opening...",
          ),
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
    final now = widget.data?['streak'];
    return Scaffold(
      body: Container(
        color: Colors.cyan[50],
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/BGofLB.png'),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "LoginBonus Calendar",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'DynaPuff',
                        color: Colors.yellow[600],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              gradient: const LinearGradient(
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight,
                                colors: [
                                  Colors.yellowAccent,
                                  Colors.white,
                                  Colors.yellowAccent,
                                  Colors.yellow,
                                ],
                              ),
                              border: Border.all(color: Colors.yellowAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${(index + 1).toString()} 日目",
                                  style: const TextStyle(
                                    fontFamily: 'ZenKurenaido',
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.redeem,
                                    color: Colors.red,
                                  ),
                                ),
                                const Text(
                                  "今日のログインボーナスだよ♪",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontFamily: 'ZenKurenaido',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (index == now + 1) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            gradient: const LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                Colors.blueAccent,
                                Colors.white,
                                Colors.blueAccent,
                                Colors.blue,
                              ],
                            ),
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //margin: const EdgeInsets.only(top:20,bottom:20),
                          child: Column(
                            children: [
                              Text(
                                "${(index + 1).toString()} 日目",
                                style: const TextStyle(
                                  fontFamily: 'ZenKurenaido',
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.question_mark,
                                  color: Colors.blue,
                                ),
                              ),
                              const Text(
                                "明日も来てね♪",
                                style: TextStyle(
                                  fontSize: 8,
                                  fontFamily: 'ZenKurenaido',
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (index > now) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            gradient: const LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                Colors.blueAccent,
                                Colors.white,
                                Colors.blueAccent,
                                Colors.blue,
                              ],
                            ),
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //margin: const EdgeInsets.only(top:20,bottom:20),
                          child: Column(
                            children: [
                              Text(
                                "${(index + 1).toString()} 日目",
                                style: const TextStyle(
                                  fontFamily: 'ZenKurenaido',
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.question_mark,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            gradient: const LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                Colors.blueGrey,
                                Colors.blueGrey,
                                Colors.blueGrey,
                                Colors.black,
                              ],
                            ),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //margin: const EdgeInsets.only(top:20,bottom:20),
                          child: Column(
                            children: [
                              Text(
                                "${(index + 1).toString()} 日目",
                                style: const TextStyle(
                                  fontFamily: 'ZenKurenaido',
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child:
                                    const Icon(Icons.done, color: Colors.green),
                              ),
                              const Text(
                                "受取済",
                                style: TextStyle(
                                  fontFamily: 'ZenKurenaido',
                                ),
                              ),
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
        ),
      ),
    );
  }
}

class Congratulations extends StatelessWidget {
  const Congratulations({Key? key}) : super(key: key);

  static const colorizeColors = [
    Colors.black,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BGofLB.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240.0,
                  height: 28.0,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          '        ', //時間稼ぎ用
                          textStyle: const TextStyle(fontSize: 20),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'ログインボーナスを獲得！',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ZenKurenaido',
                          ),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '今日も一緒に頑張ろうね♪',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ZenKurenaido',
                          ),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '        ', //時間稼ぎ用
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ZenKurenaido',
                          ),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          'ログインボーナスを獲得！',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ZenKurenaido',
                          ),
                          colors: colorizeColors,
                        ),
                        ColorizeAnimatedText(
                          '今日も一緒に頑張ろうね♪',
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'ZenKurenaido',
                          ),
                          colors: colorizeColors,
                        ),
                      ],
                      onTap: () {
                        if (kDebugMode) {
                          print("Tap Event");
                        }
                      },
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(30),
                    width: 150,
                    height: 150,
                    child: const Image(
                        image: AssetImage("assets/images/coin.jfif"))),
                const Text(
                  "知識ポイントを 5 ポイント獲得しました！",
                  style: TextStyle(
                    fontFamily: 'ZenKurenaido',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MyHomePage(
                            title: 'Kaname',
                          ),
                        ),
                      );
                    }),
                    child: const Text("メイン画面へ"),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(30),
                    width: 150,
                    height: 150,
                    child: const Image(
                        image: AssetImage("assets/images/coin.jfif"))),
                const Text("知識ポイントを 5 ポイント獲得しました！"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextButton(
                    onPressed: (() {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const MyHomePage(title: 'cccapp'),
                        ),
                      );
                    }),
                    child: const Text("メイン画面へ"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
