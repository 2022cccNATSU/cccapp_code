import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import '../Login/Login.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController editor;

  @override
  void initState() {
    editor = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            account(context: context),
            feedBack(context: context, editor: editor),
            logout(context: context),
          ],
        ),
      ),
    );
  }

  Widget account({required BuildContext context}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              title: Text(FirebaseAuth.instance.currentUser!.email.toString()),
              actions:[
                TextButton(
                  child: const Text("キャンセル"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
      child: const ListTile(
        title: Text('自分のアカウント'),
        leading: Icon(Icons.account_circle),
      ),
    );
  }

  Widget feedBack(
      {required TextEditingController editor, required BuildContext context}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              title: const Text("This is the title"),
              content: TextFormField(
                controller: editor,
              ),
              actions: [
                TextButton(
                  child: const Text("キャンセル"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("送信"),
                  onPressed: () async {
                    final email = Email(
                      body: editor.text,
                      subject: "FeedBack for RainyFairy",
                      recipients: ["kananon1931@gmail.com"],
                      cc: [""],
                      bcc: [""],
                      isHTML: false,
                    );
                    await FlutterEmailSender.send(email);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
      child: const ListTile(
        title: Text('フィードバック'),
        leading: Icon(Icons.send),
      ),
    );
  }

  Widget logout({required BuildContext context}) {
    return InkWell(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ログアウトしました。')),
        );
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        ));
      },
      child: const ListTile(
        title: Text('ログアウト'),
        leading: Icon(Icons.sensor_door),
      ),
    );
  }
}
