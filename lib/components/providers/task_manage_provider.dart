import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TasksProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Map> _pendingTasks = [];
  final List<Map> _completedTasks = [];

  bool get hasNoPendingTask => _pendingTasks.isEmpty;
  bool get hasNoCompletedTask => _completedTasks.isEmpty;
  List<Map> get pendingTasks => _pendingTasks;
  List<Map> get completedTasks => _completedTasks;

  void addNewTask(String taskContent) {
    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = taskContent;
    task['timeStamp'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    _pendingTasks.add(task);

    if (kDebugMode) {
      print(task);
    }
    notifyListeners();
  }

  void deletePendingTask(int index) {
    notifyListeners();
  }

  void completePendingTask(int index) {
    notifyListeners();
  }

  void deleteCompletedTask(int index) {
    notifyListeners();
  }
}
