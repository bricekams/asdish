import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppAuthProvider with ChangeNotifier {
  bool? signedIn;
  User? user;

  AppAuthProvider(){
    FirebaseAuth.instance.authStateChanges()
    .listen((User? user) { 
      if (user==null) {
        signedIn = false;
        setAuthStatus = false;
      } else {
        signedIn = true;
        setAuthStatus = true;
        this.user = user;
      }
      notifyListeners();
    });
  }

  bool? get isSignedIn => signedIn;

  set setAuthStatus(bool value) {
    signedIn = value;
    notifyListeners();
  }
}