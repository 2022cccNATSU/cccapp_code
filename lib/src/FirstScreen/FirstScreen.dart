import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../HomePage/HomePage.dart';
import '../LoginBonus/LoginBonus.dart';

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
          return const MyHomePage(title: 'cccapp');
        }
        return const LoginBonus(title: 'cccapp',);
      },
    );
  }
}
