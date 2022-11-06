import 'package:flutter/foundation.dart';
import 'package:to_do_app/data/constants.dart' as constant;

class BackgroundProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late int _currentBackgroundIndex = 0;
  final bg = constant.wallpaper;

  int get currentBackgroundIndex => _currentBackgroundIndex;

  void changeBackground(int number){
    _currentBackgroundIndex = number;
    notifyListeners();
  }
}
