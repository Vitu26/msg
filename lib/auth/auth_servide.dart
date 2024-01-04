import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //sign in
  Future<UserCredential> signInWithEmailPassword(String email, String pass) async {
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return userCredential;
    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //sign out

  //errors
}