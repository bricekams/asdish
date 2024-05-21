import 'package:hive_flutter/hive_flutter.dart';

class HiveInstance {
  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen("asdish")) await Hive.openLazyBox("asdish");
  }
}
