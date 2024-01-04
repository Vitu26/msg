import 'package:cloud_firestore/cloud_firestore.dart';

class ChatServices {
  //get instance of firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  /*
  List<Map<String,dynamic>> = 
  [
    {
      'email': test@gmail.com,
      'id': ..
    },
    {
      'email': testando@gmail.com,
      'id': ..
    },
  ]
  */

  //get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _fireStore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //got through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send message

  //get messages
}
