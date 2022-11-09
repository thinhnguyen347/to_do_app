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

  void editPendingTask(int index, String value) {
    _pendingTasks.removeAt(index);

    var uuid = const Uuid();
    var task = {};
    task['id'] = uuid.v1();
    task['taskContent'] = value;
    task['timeStamp'] = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    if (kDebugMode) {
      print(_pendingTasks);
    }

    _pendingTasks.insert(index, task);
    notifyListeners();
  }

  void deletePendingTask(int index) {
    _pendingTasks.removeAt(index);
    notifyListeners();
  }

  void completePendingTask(int index) {
    _completedTasks.add(_pendingTasks[index]);
    _pendingTasks.removeAt(index);

    notifyListeners();
  }

  void undoCompletedTask(int index) {
    _pendingTasks.add(_completedTasks[index]);
    _completedTasks.removeAt(index);

    notifyListeners();
  }

  void deleteCompletedTask(int index) {
    _completedTasks.removeAt(index);
    notifyListeners();
  }
}
