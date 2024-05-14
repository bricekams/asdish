import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const AsDish());
}

class AsDish extends StatelessWidget {
  const AsDish({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
