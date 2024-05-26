import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppAuthProvider with ChangeNotifier {
  bool? signedIn;
  User? user;

  AppAuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        signedIn = false;
        setAuthStatus = false;
      } else {
        try {
          // Try to get a fresh token to check if the user is still valid

          await user.getIdToken(true);
          await user.reload();
          log(user.toString(),name: "AuthProvider");
          // if (!user.emailVerified && user.phoneNumber == null) {
          //   await user.delete();
          // }
          log(user.email ?? "no email");
          signedIn = true;
          setAuthStatus = true;
          this.user = user;
        } catch (e) {
          log("Auth provider error: $e");
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

  void signOut () async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
