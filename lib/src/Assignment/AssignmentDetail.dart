import 'package:flutter/material.dart';

import '../../widget/Constants.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: themeColor),
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatelessWidget{
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
        hintStyle: const TextStyle(color: textColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: onClickButtonColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: textColor,
          ),
        ),
      ),
      obscureText: obscureText,
    );
  }
}

//日付、内容、決定のボタン
class InputForm extends StatelessWidget{
  const InputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SelectSubject(),
        const SizedBox(height: 48),
        const _CustomTextField(
          labelText: '日付',
          hintText: '日付を入力してください',
          obscureText: false,
        ),
        const SizedBox(height: 48),
        const _CustomTextField(
          labelText: '内容',
          hintText: 'やる課題を入力してください',
          obscureText: false,
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: textColor,
              backgroundColor: textColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {

            },
            child: Text(
              '決定！',
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: decisionButtonTextColor, fontSize: 18),
            ),
          ),
        ),

      ],
    );
  }

}