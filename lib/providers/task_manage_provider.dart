import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:to_do_app/utilities/app_shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TasksProvider with ChangeNotifier {
  late List<Map> _pendingTasks = [];

  late List<Map> _completedTasks = [];

  bool get hasNoPendingTask => _pendingTasks.isEmpty;

  bool get hasNoCompletedTask => _completedTasks.isEmpty;

  List<Map> get pendingTasks => _pendingTasks;

  List<Map> get completedTasks => _completedTasks;

  setPending(value) {
    _pendingTasks = value;
    notifyListeners();
  }

  setCompleted(value) {
    _completedTasks = value;
    notifyListeners();
  }

  void addNewTask(String taskContent, String expDate) {
    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = taskContent;
    task['expDate'] = expDate;

    _pendingTasks.add(task);

    if (kDebugMode) {
      print(task);
    }
    var temp = _pendingTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setPendingTasks(temp);

    notifyListeners();
  }

  void editPendingTask(int index, String value, String expDate) {
    _pendingTasks.removeAt(index);

    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = value;
    task['timeStamp'] = expDate;

    _pendingTasks.insert(index, task);

    var temp = _pendingTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setPendingTasks(temp);

    notifyListeners();
  }

  void deletePendingTask(int index) {
    _pendingTasks.removeAt(index);

    var temp = _pendingTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setPendingTasks(temp);

    notifyListeners();
  }

  void completePendingTask(int index) {
    _completedTasks.add(_pendingTasks[index]);
    var temp = _completedTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setCompletedTasks(temp);

    _pendingTasks.removeAt(index);
    var temp2 = _pendingTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setPendingTasks(temp2);

    notifyListeners();
  }

  void undoCompletedTask(int index) {
    _pendingTasks.add(_completedTasks[index]);
    var temp = _pendingTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setPendingTasks(temp);

    _completedTasks.removeAt(index);
    var temp2 = _completedTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setCompletedTasks(temp2);

    notifyListeners();
  }

  void deleteCompletedTask(int index) {
    _completedTasks.removeAt(index);
    var temp2 = _completedTasks.map((e) => jsonEncode(e)).toList();
    AppSharedPreferences.setCompletedTasks(temp2);

    notifyListeners();
  }
}
