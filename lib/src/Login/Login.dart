import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../FirstScreen/FirstScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = ('');
  String ma = '';
  String pw = '';


  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/mori.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Welcome to",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 50.0,
                        offset: Offset(3, 7),
                      ),
                    ],
                    color: Colors.white,
                    fontFamily: 'Lobster',
                    fontSize: 50,
                    letterSpacing: 3.0,
                  ),
                ),
                Container(
                  width: 350,
                  height: 350,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/No_Image.jpg"),
                    ),
                  ),
                ),
                const NeededInfoText(
                  color: 0xFFFFBE3B,
                  text: 'Mail address',
                ),
                Container(
                  width: 300,
                  height: 40,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'メールアドレス',
                    ),
                    onChanged: (text) {
                      ma = text;
                    },
                  ),
                ),
                const NeededInfoText(
                  color: 0xFFF44336,
                  text: 'Password',
                ),
                Container(
                  width: 300,
                  height: 40,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: true,
                    //minLength: A,
                    //maxLength: B,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'パスワード',
                    ),
                    onChanged: (String text) {
                      pw = text;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButton(
                      text: 'ログイン',
                      num: 1,
                      ma: ma,
                      pw: pw,
                    ),
                    LoginButton(
                      text: 'サインイン',
                      num: 0,
                      ma: ma,
                      pw: pw,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NeededInfoText extends StatelessWidget {
  const NeededInfoText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final int color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(
        text,
        style: TextStyle(
          shadows: [
            Shadow(
              color: Color(color),
              blurRadius: 25.0,
              offset: const Offset(3, 7),
            ),
          ],
          color: Colors.white,
          fontFamily: 'Lobster',
          fontSize: 25,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {Key? key,
      required this.text,
      required this.num,
      required this.ma,
      required this.pw})
      : super(key: key);
  final String text;
  final int num;
  final String ma;
  final String pw;

  @override
  Widget build(BuildContext context) {
    final UserState userState = Provider.of<UserState>(context);
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 150,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 16,
          shape: const StadiumBorder(),
        ),
        onPressed: () async {
          if (num == 1) {
            try {
              final FirebaseAuth auth = FirebaseAuth.instance;
              final result = await auth.signInWithEmailAndPassword(
                email: ma,
                password: pw,
              );
              userState.setUser(result.user!);
              if (kDebugMode) {
                print(ma);
              }
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return const FirstScreen();
                }),
              );
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          } else if (num == 0) {
            try {
              final FirebaseAuth auth = FirebaseAuth.instance;
              var today = DateFormat('yyyy-MM-dd').format(DateTime.now());

              await auth.createUserWithEmailAndPassword(
                email: ma,
                password: pw,
              );
              final FirebaseFirestore firebase = FirebaseFirestore.instance;
              final User? user = FirebaseAuth.instance.currentUser;
              final uid = user?.uid;

              await firebase.collection('points').doc(uid).set({'points': 0});
              await firebase
                  .collection('login')
                  .doc(uid)
                  .set({'date': today.toString(), 'streak': 0});

              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return const FirstScreen();
                }),
              );
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          }
        },
        child: Text(text),
      ),
    );
  }
}
