import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagraphql/model/ContestModel.dart';

class DatabaseFire {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream<ContestModel> getUserList() async{
  //   var document = await Firestore.instance.document('COLLECTION_NAME/TESTID1');
  //   document.get() => then(function(document) {
  //   print(document("name"));
  //   });
  // }

  Stream<List<ContestModel>> getCompletedUserList() {
    return _firestore
        .collection('contests')
        .where("endDate",
            isLessThanOrEqualTo:
                new DateTime.now().toUtc().millisecondsSinceEpoch)
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((document) => ContestModel.fromJson({
                  "id": document.id,
                  "title": document.data()['title'],
                  "description": document.data()['description'],
                  "imageUrl": document.data()['imageUrl'],
                  "status": document.data()['status']
                }))
            .toList());
  }
}
