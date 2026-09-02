import 'package:flutter/foundation.dart';

class LanguageProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _currentLanguage = 'en';

  String get currentLanguage => _currentLanguage;

  void setCurrentLanguage(String lang) {
    _currentLanguage = lang;
    notifyListeners();
  }
}
