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
          final User? user = FirebaseAuth.instance.currentUser;
          final uid = user?.uid;
          return FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
            future: FirebaseFirestore.instance.collection('login').doc(uid).get(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                var receivedData = snapshot.data!;
                var today = DateFormat('yyyy-MM-dd').format(DateTime.now());
                if (receivedData.data()!['date'] != today) {
                  return LoginBonus(title: 'cccapp',data: receivedData.data()!);
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
