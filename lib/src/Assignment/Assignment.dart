import 'dart:math';
import 'package:flutter/material.dart';
import 'Calendar.dart';
import 'AssignmentDetail.dart';

const ParameterBeginColor = Color(0xFFFF006F);//グラフの始まりの色
const PameterEndColor = Color(0xFF8337EC);//グラフの終わりの色
const TopBarColor = Color(0xFF2E8376);//大体の影の色
const TextColor = Colors.white;//テキスト+背景色+アイコンの色
const TopBarShadowColor = Colors.black26;//上のバーの影の色
const AssignmentTextColor = Color(0xFFE0E0E0);//課題のテキストの色
const AssignmentIconColor = Color(0xFF424242);//課題のアイコンの色
const ListShadowColor = Colors.grey;//リストの影の色
const ListSubjectColor = Colors.blueAccent;//リストのサブジェクトの色

//Taskがよばれたときに実行
class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: TopBarColor,
        backgroundColor: TextColor,
      ),
      home: Assingment(),
    );
  }
}

//Class Taskのホームで呼ばれて実行される
class Assingment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(),
          TaskManager(),
          TaskText(),
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}


//上のバーの部分
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //緑の部分
        Material(
          color: TopBarColor,
          elevation: 24,
          shadowColor: TopBarShadowColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 30,
              bottom: 50,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: TextColor,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Calender()));
                      },
                    ),
                    SizedBox(width: 50,),
                    Icon(
                      Icons.notes_outlined,
                      color: TextColor,
                    ),
                    SizedBox(width: 20,),
                    Text(
                      '教科名',
                      style: TextStyle(
                        color: TextColor,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//グラフの外側
class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage; // 課題進捗度の割合
  final double textCircleRadius; // 内側に表示される白丸の半径

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 5) {
      final per = i / 360.0;
      // 割合（0~1.0）からグラデーション色に変換
      final color = ColorTween(
        begin: ParameterBeginColor,
        end: PameterEndColor,
      ).lerp(per)!;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      final spaceLen = 16; // 円とゲージ間の長さ
      final lineLen = 24; // ゲージの長さ
      final angle = (2 * pi * per) - (pi / 2); // 0時方向から開始するため-90度ずらす

      // 円の中心座標
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側部分の座標
      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

//グラフの内側
class BatteryLevelIndicator extends StatelessWidget {
  final percentage = 0.1;//がんばってデータとる
  final size = 150.0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size * 0.5,
      ),
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Material(
          color: TextColor,
          elevation: 4,
          borderRadius: BorderRadius.circular(size * 0.5),
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}%',
                style: TextStyle(color: ParameterBeginColor, fontSize: 42),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//グラフとテキスト
class TaskManager extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 200,
            top: 10,
            bottom: 0,
          ),
          child: Text(
            '課題進捗度',
            style: TextStyle(
                fontSize: 24.0,
                color: TopBarShadowColor
            ),
          ),
        ),
        BatteryLevelIndicator(),
      ],
    );
  }
}

//課題というテキストのため
class TaskText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 250,
        top: 10,
        bottom: 0,
      ),
      child: Text(
        '課題',
        style: TextStyle(
            fontSize: 24.0,
            color: TopBarShadowColor
        ),
      ),
    );
  }

}
//追加と編集のアイコンとテキスト
class _DetailHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: AssignmentTextColor,
                width: 48,
                height: 48,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: AssignmentIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddTask()));
                  },
                ),
              ),
            ),
            title: Text('追加'),
            subtitle: Text(''),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: AssignmentTextColor,
                width: 48,
                height: 48,
                child: Icon(
                  Icons.edit,
                  color: AssignmentIconColor,
                ),
              ),
            ),
            title: Text('編集'),
            subtitle: Text(''),
          ),
        ),
      ],
    );
  }
}

//課題の詳細の書かれたリストのプログラム
class _Post extends StatelessWidget {
  final String subname;
  final String date;
  final String content;
  final Color color;

  const _Post({
    Key? key,
    required this.subname,
    required this.date,
    required this.content,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,),
      child: Card(
        elevation: 8,
        shadowColor: ListShadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(color: color),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        subname,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: TextColor,
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    '日付:   $date',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    '内容:   $content',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//リストのインスタンス
class TaskList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _DetailHeader(),
          Expanded(
              child: ListView(
                children: [
                  _Post(subname: '算数', date: '7月28日',content: '問題集１～３',color: ListSubjectColor),
                ],
              ))
        ],
      ),
    );
  }
}