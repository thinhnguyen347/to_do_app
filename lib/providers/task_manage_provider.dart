import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/utilities/app_shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TasksProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late final List<Map> _pendingTasks =
      jsonDecode(AppSharedPreferences.getPendingTasks() as String);

  final List<Map> _completedTasks =
      jsonDecode(AppSharedPreferences.getCompletedTasks() as String);

  bool get hasNoPendingTask => _pendingTasks.isEmpty;

  bool get hasNoCompletedTask => _completedTasks.isEmpty;

  List<Map> get pendingTasks => _pendingTasks;

  List<Map> get completedTasks => _completedTasks;

  void addNewTask(String taskContent) {
    if (kDebugMode) {
      print('run');
      print(AppSharedPreferences.getPendingTasks());
    }

    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = taskContent;
    task['timeStamp'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    _pendingTasks.add(task);
    AppSharedPreferences.setPendingTasks(jsonEncode(_pendingTasks));

    notifyListeners();
  }

  void editPendingTask(int index, String value) {
    _pendingTasks.removeAt(index);

    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = value;
    task['timeStamp'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    _pendingTasks.insert(index, task);
    AppSharedPreferences.setPendingTasks(jsonEncode(_pendingTasks));

    notifyListeners();
  }

  void deletePendingTask(int index) {
    _pendingTasks.removeAt(index);
    AppSharedPreferences.setPendingTasks(jsonEncode(_pendingTasks));
    notifyListeners();
  }

  void completePendingTask(int index) {
    _completedTasks.add(_pendingTasks[index]);
    AppSharedPreferences.setCompletedTasks(jsonEncode(_completedTasks));

    _pendingTasks.removeAt(index);
    AppSharedPreferences.setPendingTasks(jsonEncode(_pendingTasks));

    notifyListeners();
  }

  void undoCompletedTask(int index) {
    _pendingTasks.add(_completedTasks[index]);
    AppSharedPreferences.setPendingTasks(jsonEncode(_pendingTasks));

    _completedTasks.removeAt(index);
    AppSharedPreferences.setCompletedTasks(jsonEncode(_completedTasks));

    notifyListeners();
  }

  void deleteCompletedTask(int index) {
    _completedTasks.removeAt(index);
    AppSharedPreferences.setCompletedTasks(jsonEncode(_completedTasks));

    notifyListeners();
  }
}
