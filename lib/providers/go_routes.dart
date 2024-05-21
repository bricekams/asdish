import 'package:flutter/cupertino.dart';

class GoRoutesProvider with ChangeNotifier {
  int _current = 0;
  int get current => _current;

  set setCurrent (index) {
    _current = index;
    notifyListeners();
  }
}