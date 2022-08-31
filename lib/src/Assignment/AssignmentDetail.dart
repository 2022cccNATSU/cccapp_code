import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../widget/Constants.dart';
import '../../widget/Colors.dart';
import 'Assignment.dart';

var selectedValue = "学校";

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

class InputPage extends StatelessWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            InputForm(),
          ],
        ),
      ),
    );
  }
}

class SelectSubject extends StatefulWidget {
  const SelectSubject({Key? key}) : super(key: key);

  @override
  State<SelectSubject> createState() => _SelectSubject();
}
//教科のリスト
class _SelectSubject extends State<SelectSubject> {
  final lists = <String>["学校", "資格", "趣味", "その他"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 80, right: 80), //パディングの設定
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
  final TextEditingController controller;

  const _CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
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
class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final firebase = FirebaseFirestore.instance;
  late TextEditingController valueController;
  dynamic dateTime;

  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2022),
        lastDate: DateTime(2040));
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        dateTime = datePicked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    valueController = TextEditingController();
    dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SelectSubject(),
        const SizedBox(height: 48),
        Row(
          children: [
            Text(dateTime.toString()),
            IconButton(
              icon: const Icon(
                Icons.calendar_month,
              ),
              onPressed: () {
                _datePicker(context);
              },
            ),
          ],
        ),
        const SizedBox(height: 48),
        _CustomTextField(
          controller: valueController,
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
            onPressed: () async {
              final User? user = FirebaseAuth.instance.currentUser;
              final uid = user?.uid;
              try {
                await firebase.collection('assignment').doc(uid!).collection(DateTime.now().toString()).doc().set({
                  'content': valueController.text,
                  'date': dateTime.toString(),
                  'subname': selectedValue,
                  'color': ColorDetail.randomColor(),
                });
              } catch (e) {
                if (kDebugMode) {
                  print(e);
                }
              }
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Assingment()));
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
