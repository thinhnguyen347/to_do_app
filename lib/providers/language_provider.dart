import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late String _currentLanguage;

  String get currentLanguage => _currentLanguage;

  void setCurrentLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }
}
