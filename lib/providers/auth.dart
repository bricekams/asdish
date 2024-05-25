import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppAuthProvider with ChangeNotifier {
  bool? signedIn;
  User? user;

  AppAuthProvider(){
    FirebaseAuth.instance.authStateChanges()
    .listen((User? user) async {
      log(user.toString());
      if (user == null) {
        signedIn = false;
        setAuthStatus = false;
      } else {
        try {
          // Try to get a fresh token to check if the user is still valid
          await user.getIdToken(true);
          signedIn = true;
          setAuthStatus = true;
          this.user = user;
        } catch (e) {
          log("Error fetching token: $e");
          signedIn = false;
          setAuthStatus = false;
          this.user = null;
        }
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