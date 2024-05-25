import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithEmailAndPassword(
    {required String email, required String password}) async {
  try {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  } on FirebaseAuthException catch (_) {
    rethrow;
  }
}