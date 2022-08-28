import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Succeed を返したときに処理が実行されるように実装する
// Succeed 以外の時はエラーとして表示する >> Switch や if else が使える
//
// 使い方の例：
// String message = KnowledgePoint.applyPoint(example);
// if ( message == 'Succeed'){
//  色々な処理の実行
// } else {
//  return Text(message)
// }

class KnowledgePoint {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<String> applyPoint(int point) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    DocumentSnapshot ds = await firebase.collection('points').doc(uid).get();
    int thisData = ds['points'] + 0;
    if (ds.exists && thisData + point > 0) {
      await firebase
          .collection('points')
          .doc(uid)
          .set({'points': thisData + point});
      return "Succeed";
    } else if (!ds.exists) {
      await firebase.collection('points').doc(uid).set({'points': point});
      return "Succeed";
    } else if (ds.exists) {
      return "ポイントが足りません";
    } else {
      return "データが存在しません";
    }
  }
}
