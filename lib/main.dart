import 'package:asdish/config/go_routes.dart';
import 'package:asdish/config/hive.dart';
import 'package:asdish/config/theme.dart';
import 'package:asdish/firebase_options.dart';
import 'package:asdish/providers/auth.dart';
import 'package:asdish/providers/go_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await HiveInstance.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GoRoutesProvider()),
      ChangeNotifierProvider(create: (context) => AppAuthProvider()),
    ],
    child: const AsDish(),
  ));
}

class AsDish extends StatelessWidget {
  const AsDish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligth,
      routerConfig: appRouter,
    );
  }
}
