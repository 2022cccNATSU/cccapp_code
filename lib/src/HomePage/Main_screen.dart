import 'dart:io';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


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
                images(),
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
          child: comments(),
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
  Widget images(){
    if(_counter1==0){
      return Image.asset('assets/images/smile1.png');
    }else if(_counter1==1){
      return Image.asset('assets/images/smile2.png');
    }else if(_counter1==2){
      return Image.asset('assets/images/smile3.png');
    }else if(_counter1==3){
      return Image.asset('assets/images/smile4.png');
    }else if(_counter1==4){
      return Image.asset('assets/images/smile_oops.png');
    }else if(_counter1==5){
      return Image.asset('assets/images/oops.png');
    }else if(_counter1==6){
      return Image.asset('assets/images/question1.png');
    }else{
      return Image.asset('assets/images/smile1.png');
    }
  }
 Text comments(){
    if(_counter1==0){
      if(_counter2==0)return Text('今日も一緒に頑張ろうね。');
      else if(_counter2==1)return Text('今日もお疲れ様。');
      else if(_counter2==2)return  Text('勉強頑張ってね！応援してるよ。');
      else return Text('');
    }else if(_counter1==1){
      if(_counter2==0)return Text('疲れたら休むのもアリだよ。健康第一だからね。');
      else if(_counter2==1)return Text('暗記物は寝る直前にやると頭に定着しやすいんだって。暗記が必要な時は試してみてね。');
      else if(_counter2==2)return Text('わからない問題は答えを見てぜんぜんオッケーだよ。あ、でも解説はちゃんと見てね！自分だけで長い間悩むより、解き方を覚えっちゃった方が早いもんね');
      else return Text('');
    }else if(_counter1==2) {
      if (_counter2 == 0) return Text('私は休み時間にお菓子を食べてリフレッシュするの♪きのこの山もたけのこの里も、両方好きだよ'); //ドクターペッパーは嫌いかな．．．
      else if (_counter2 == 1) return Text('解けなかった問題が解けるようになると楽しいね♪');
      else if (_counter2 == 2) return Text('遠い大学にいっちゃったけど、昔はお姉さまが勉強を教えてくれたの。私も頑張らないと。');
      else return Text('');
    }else if(_counter1==3){
      if(_counter2==0)return Text('ふふっ、勉強頑張ったからテストの点数良かったんだ♪お母様もほめてくれるかな。');
      else if(_counter2==1)return Text('ふふっ、勉強頑張ったからテストの点数良かったんだ♪お父様もほめてくれるかな。');
      else if(_counter2==2)return Text('やっぱり、休憩時間にはハチミツ牛乳だね！甘くて、まろやかで、お気に入りなの♪');
      else return Text('');
    }else if(_counter1==4){
      if(_counter2==0)return Text('勉強って勢いついちゃうと、意識して休憩を取るのが難しくなっちゃうよね');
      else if(_counter2==1)return Text('あはは．．．消しゴムなくしたと思って新しいのを買ったのに、筆箱の奥に入ってた．．．');
      else if(_counter2==2)return Text('課題の提出日はちゃんとチェックしないとね、本当に．．．');
      else return Text('');
    }else if(_counter1==5){
      if(_counter2==0)return Text('むむむ、この問題全く分からない．．．あとで解説見ないと');
      else if(_counter2==1)return Text('あれれ、こんな問題あったっけ？．．．問題１個飛ばしちゃってる．．．');
      else if(_counter2==2)return Text('落とした消しゴム、いったいどこに消えたんだろう．．．');
      else return Text('');
    }else if(_counter1==6){
    if(_counter2==0)return Text('なんかあったような気がするけど．．．まぁいっか♪');
    else if(_counter2==1)return Text('今日は何か課題出た？しっかりメモして覚えておこうね');
    else if(_counter2==2)return Text('調子はどうかな？今日はどれくらい勉強するの？');
    else return Text('');
    }else{
      return Text('');
    }
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