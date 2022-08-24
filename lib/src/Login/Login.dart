import 'package:flutter/material.dart';
import 'package:cccapp_code/src/LoginBonus/LoginBonus.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = ('');
  String ma = ('');
  String pw = ('');


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
            child:Container(
              width: MediaQuery.of(context).size.width-10,
              height: MediaQuery.of(context).size.height-80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/waku.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  const Text(
                    "Welcome to",
                    style:TextStyle(
                      shadows: [
                        Shadow(
                          color: Colors.black,
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
                            image: AssetImage("assets/images/rf.jpg")
                        )
                    ),
                  ),
                  const NeededInfoText(color: 0xFF03A9F4, text: 'User name',),
                  SizedBox(
                    width:300,
                    height:40,
                    child: TextFormField(
                      //minLength: A,
                      //maxLength: B,
                      style:const TextStyle(
                        fontSize: 15,
                      ),
                      decoration: const InputDecoration(
                        fillColor: Colors.white,//white
                        filled: true,
                        hintText: 'ユーザー名(A文字～B文字)',
                      ),
                      onChanged: (text) {
                        username = text;
                      },
                    ),
                  ),
                  const NeededInfoText(color: 0xFFFFBE3B, text: 'Mail address',),//
                  SizedBox(
                    width:300,
                    height:40,
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
                  SizedBox(
                    width:300,
                    height:40,
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
                      onChanged: (text) {
                        pw = text;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      LoginBotton(text: 'ログイン',num: 1,),
                      LoginBotton(text: 'ゲスト',num:0,),
                    ],
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
  const LoginBotton({Key? key,required this.text,required this.num}):super (key:key);
  final String text;
  final int num;

  @override
  Widget build(BuildContext context) {
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
        onPressed:(){
          //TODO: ここの2段にログインとゲスト用それぞれの処理欄を用意したのでログインの場合はユーザ名とパスワードを送るようにしてください！
          if(num == 1){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginBonus(title: 'ログイン',),
              ),
            );
          }else{
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