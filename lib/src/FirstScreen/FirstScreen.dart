import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../HomePage/HomePage.dart';
import '../Login/Login.dart';
import '../Login/LoginBonus.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          final User user = FirebaseAuth.instance.currentUser!;
          final uid = user.uid;
          // final defaultInfo = {"date":"2022-08-31","streak":0};
          return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance.collection('login').doc(uid).get(),
            builder: (context, snapshot) {
              print(snapshot.data!.data());
              if(snapshot.hasData) {
                var today = DateFormat('yyyy-MM-dd').format(DateTime.now());
                if (false/*snapshot.data!['date'].toString() == today*/) {
                  return LoginBonus(title: 'cccapp',data: snapshot.data!.data()!);
                } else {
                  return const MyHomePage(title: 'cccapp');
                }
              }
              return const CircularProgressIndicator();
            }
          );
        } else if(snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const LoginPage();
      },
    );
  }
}
