import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:intl/intl.dart';

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
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('login').doc(uid).snapshots(),
            builder: (context, snapshot) {
              if (kDebugMode) {
                //print(snapshot.data!);
              }
              if(snapshot.hasData) {
                //var today = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
                var userDocument = snapshot.data;
                if (false/*snapshot.data!['date'].toString() == today*/) {
                  return LoginBonus(title: 'cccapp',data: userDocument?.data());
                } else {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) {return const MyHomePage(title: 'cccapp_code');}));
                  // return const Text("Strange Error");
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
