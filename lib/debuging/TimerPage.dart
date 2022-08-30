import 'dart:async';
import 'package:flutter_picker/Picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TimerPage extends StatefulWidget{
  @override
  State<TimerPage> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage>{
  Timer? _timer;//時間を測定
  DateTime? _time;//
  DateTime? _datetime;
  bool isStart = false;
  double size = 200.0;
  double percentage = 1.00;
  double denominator = 1.00;
  @override
  void initState() {
    _time = DateTime.utc(0,0,0);
    _datetime = DateTime.utc(0,0);
    super.initState();
  }

  void startTimer(){
    _timer = Timer.periodic
      (
        Duration(seconds: 1),
        (Timer timer){
          setState(() {
            _time = _time!.add(Duration(seconds: -1));
            percentage = (_time!.minute*60.00 + _time!.second)/denominator;
            if(_time!.minute == 0&&_time!.second == 0){
              cancelTimer();
              breakTimerSet();
              percentage = 1.00;
            }
          });
        });
  }

  void timerSet(int minute,int second){
    isStart = true;
    _time = _time!.add(Duration(minutes: minute,seconds: second));
    denominator = _time!.minute*60.00 + _time!.second;
    startTimer();
  }


  void breakTimerSet(){
    _time = _time!.add(Duration(minutes: 5));
    denominator = _time!.minute*60.00 + _time!.second;
    startTimer();
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                padding: EdgeInsetsDirectional.only(start: 200,top: 30),
                onPressed: () async {
                  Picker(
                  adapter: DateTimePickerAdapter(
                  type: PickerDateTimeType.kHMS,
                      value: _datetime,
                      customColumnType: [4, 5]),
                    title: Text("Select Time"),
                    onConfirm:
                        (Picker picker, List value) {
                    setState(() => {
                      _datetime = DateTime.utc(0,0),//前追加された数値が残ってしまっているので、初期化する
                      _datetime = _datetime!.add(Duration(minutes: value[0],seconds: value[1]))});
                    },
                  ).showModal(context);
                  },
                icon: Icon(Icons.timer,size: 31,),
              ),
              SizedBox(height: 35,),
              CustomPaint(
                painter: _TimerLevelIndicatorPainter(
                  percentage: percentage,
                  textCircleRadius: size * 0.5,
                ),
                child: Container(
                  padding: const EdgeInsets.all(64),
                    child: Container(
                      width: size,
                      height: size,
                      child: Center(
                        child:Text(DateFormat.ms().format(_time!),
                          style: Theme.of(context).textTheme.headline2,
                          ),
                      ),
                    ),
                ),
              ),
              SizedBox(height: 35,),
              SizedBox(
                width: 200,height: 50,
                child: ElevatedButton(
                  child: Text(
                    isStart ? 'Finish!': 'Start!',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(

                    primary: isStart? Colors.tealAccent:
                        Colors.lightBlueAccent,
                    onPrimary: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    if(isStart){
                      cancelTimer();
                    }else{
                      timerSet(_datetime!.minute,_datetime!.second);
                    }
                    },
                ),
              ),
          ]
        ),
      ),
    );
  }
}

//周りの線を描画するウィジェット
class _TimerLevelIndicatorPainter extends CustomPainter {
  final double percentage; // バッテリーレベルの割合
  final double textCircleRadius; // 内側に表示される白丸の半径

  _TimerLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 1; i < (360 * percentage); i += 1) {
      final per = i / 360.0;
      // 割合（0~1.0）からグラデーション色に変換
      final color = ColorTween(
        begin: Colors.lightBlueAccent,
        end: Colors.tealAccent,
      ).lerp(per)!;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4;

      final spaceLen = 32; // 円とゲージ間の長さ
      final lineLen = 15; // ゲージの長さ
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