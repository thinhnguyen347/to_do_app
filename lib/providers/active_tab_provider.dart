import 'package:flutter/foundation.dart';

class ActiveTabProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late int _activeTab = 0;

  int get activeTaskTab => _activeTab;

  void setActiveTab(int number){
    _activeTab = number;
    notifyListeners();
  }
}
