import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFire {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateWinner(String winnerName, String winnerNumber) async {
    await _firestore
        .collection('winners')
        .doc('selectedwinners')
        .update({winnerNumber: winnerName});
    // await _firestore
    //     .collection('contests')
    //     .doc(contestId)
    //     .collection('users')
    //     .doc(userId)
    //     .update({
    //   'isWinner': true,
    // });
  }
}
