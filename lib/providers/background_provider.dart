import 'package:flutter/foundation.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/utilities/app_shared_preferences.dart';

class BackgroundProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late int _currentBackgroundIndex =
      AppSharedPreferences.getBackground() as int;
  final bg = constant.wallpaper;

  int get currentBackgroundIndex => _currentBackgroundIndex;

  void changeBackground(int number) {
    _currentBackgroundIndex = number;
    AppSharedPreferences.setBackgroundIndex(number);
    notifyListeners();
  }
}
