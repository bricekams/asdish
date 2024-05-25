import 'package:asdish/config/go_routes.dart';
import 'package:asdish/config/hive.dart';
import 'package:asdish/config/theme.dart';
import 'package:asdish/firebase_options.dart';
import 'package:asdish/lib/flutter_hot_toast.dart';
import 'package:asdish/providers/auth.dart';
import 'package:asdish/providers/shell.dart';
import 'package:asdish/providers/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveInstance.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShellIndexProvider()),
        ChangeNotifierProvider(create: (context) => AppAuthProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
      ],
      child: const AsDish(),
    ),
  );
}

class AsDish extends StatelessWidget {
  const AsDish({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayWholeScreen: false,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.ligth,
        routerConfig: appRouter,
      ),
    );
  }
}
