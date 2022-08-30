// TODO: 知識ポイントを増加したときに

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

// Succeed を返したときに処理が実行されるように実装する
// Succeed 以外の時はエラーとして表示する >> Switch や if else が使える
//
// 使い方の例：
// String message = KnowledgePoint.applyPoint(example);
// ↑これで送信
// if ( message == 'Succeed'){
//  Navigator.of(context).push(MaterialPageRoute(builder:(context) => Example()));
// } else {
//  return Text(message)
// }

class KnowledgePoint {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<String> applyPoint(int point) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    int thisData = 0;
    late DocumentSnapshot ds;
    try {
      ds = await firebase.collection('points').doc(uid).get();
      thisData = ds['points'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return "不明なエラーが発生";
    }
    if (ds.exists && thisData + point > 0) {
      await firebase
          .collection('points')
          .doc(uid)
          .set({'points': thisData + point});
      return "Succeed";
    } else if (!ds.exists) {
      await firebase.collection('points').doc(uid).set({'points': point, 'date':DateTime.now()});
      return "Succeed";
    } else if (ds.exists) {
      return "ポイントが足りません";
    } else {
      return "不明なエラーが発生";
    }
  }
}
