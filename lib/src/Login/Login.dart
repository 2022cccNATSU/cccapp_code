import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cccapp_code/src/LoginBonus/LoginBonus.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'CreatAccount.dart';

///問題点　authenticationにユーザーネームはつかわない、ゲストログイン時の処理を決めてない、登録のうぃじぇっといらない
///providerで作った方がいいかも


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
              children: <Widget> [
                Container(
                padding:  EdgeInsetsDirectional.only(
                    bottom: 10,
                    start: 200
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    elevation: 16,
                    shape: const StadiumBorder(),
                  ),
              onPressed:()async{
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateAccount(),
                    ),
                );
              },
              child: Text('アカウントを作成'),
            ),
          ),
                const Text(
                  "Welcome to",
                  style:TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 50.0/*影の大きさ*/,
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
                          image: AssetImage("assets/images/No_Image.jpg")
                      )
                  ),
                ),
                const NeededInfoText(color: 0xFFFFBE3B, text: 'Mail address',),
                Container(
                  width:300,
                  height:40,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    style:const TextStyle(
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
                const NeededInfoText(color: 0xFFF44336, text: 'Password',),
                Container(
                  width:300,
                  height:40,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(),
                    ],
                  ),
                  child: TextFormField(
                    obscureText: true,
                    //minLength: A,
                    //maxLength: B,
                    style:const TextStyle(
                      fontSize: 15,
                    ),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'パスワード(A文字～B文字)',
                    ),
                    onChanged: (String text) {
                      pw = text;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginBotton(text: 'ログイン',num: 1,ma: ma,pw: pw,),
                    LoginBotton(text: 'ゲスト',num:0,ma: '',pw: '',),
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
  const NeededInfoText({Key? key,required this.text,required this.color,}) : super(key: key);
  final String text;
  final int color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Text(
        text,
        style:TextStyle(
          shadows: [
            Shadow(
              color: Color(color),
              blurRadius: 25.0/*影の大きさ*/,
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

class LoginBotton extends StatelessWidget {
  LoginBotton({Key? key,required this.text,required this.num,required this.ma,required this.pw}):super (key:key);
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
        onPressed:()async{
          //TODO: ここの2段にログインとゲスト用それぞれの処理欄を用意したのでログインの場合はユーザ名とパスワードを送るようにしてください！
          if(num == 1)//login
            {
            try {
              // メール/パスワードでログイン
              final FirebaseAuth auth = FirebaseAuth.instance;
              final result = await auth.signInWithEmailAndPassword(
                email: ma,
                password: pw,
              );
              // ユーザー情報を更新
              userState.setUser(result.user!);
              // ログインに成功した場合
              // チャット画面に遷移＋ログイン画面を破棄
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) {
                  return LoginBonus(title: 'LogIn');
                }),
              );
            } catch (e) {
              print(e);
            }

          }else if(num == 0)//gestlogin
             {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginBonus(title: 'ゲスト',),
              ),
            );
          }
        },
        child: Text(text),
      ),
    );
  }
}