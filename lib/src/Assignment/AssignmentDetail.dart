import 'package:flutter/material.dart';
import 'AssignmentDetail.dart';
const Color ThemeColor = Color(0xFFFE7C64);//テーマカラー
const Color BackGroundColor = Color(0xFF19283D);//背景の色
const Color TextColor = Color(0xFFB0BEC5);//全体のテキストの色
const Color OnClickButtonColor = Color(0xFFFE7C64);//ボタンがクリックされたときの枠の色
const Color DecisionButtonTextColor = Colors.black87;//決定ボタンのテキストの色

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ThemeColor),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackGroundColor,
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputForm(),
            ],
          ),
        )
    );
  }
}

class SelectSubject extends StatefulWidget {
  const SelectSubject({Key? key}) : super(key: key);

  @override
  State<SelectSubject> createState() => _SelectSubject();
}
//教科のリスト
class  _SelectSubject extends State<SelectSubject> {
  var selectedValue = "国語";
  final lists = <String>["国語", "数学", "なんか", ];

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 80,right: 80), //パディングの設定
        ),
        value: selectedValue,
        items: lists
            .map((String list) =>
            DropdownMenuItem(value: list, child: Text(list)))
            .toList(),
        onChanged: (String? value) {
          setState(() {
            selectedValue = value!;
          });
        },
      ),
    );

  }

}
//日付、内容入力のためのタイピングボードをだす
class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const _CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(color: TextColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: OnClickButtonColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: TextColor,
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }
}

//日付、内容、決定のボタン
class InputForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SelectSubject(),
        SizedBox(height: 48),
        _CustomTextField(
          labelText: '日付',
          hintText: '日付を入力してください',
          obscureText: false,
        ),
        SizedBox(height: 48),
        _CustomTextField(
          labelText: '内容',
          hintText: 'やる課題を入力してください',
          obscureText: true,
        ),
        SizedBox(height: 48),
        Container(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: TextColor,
              backgroundColor: TextColor,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              '決定！',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: DecisionButtonTextColor, fontSize: 18),
            ),
          ),
        ),

      ],
    );
  }

}