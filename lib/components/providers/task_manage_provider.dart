import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/task.dart';
import 'package:uuid/uuid.dart';

class TasksProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Task> _pendingTasks = [];
  final List<Task> _completedTasks = [];

  bool get hasNoPendingTask => _pendingTasks.isEmpty;
  bool get hasNoCompletedTask => _completedTasks.isEmpty;
  List<Task> get pendingTasks => _pendingTasks;
  List<Task> get completedTasks => _completedTasks;

  void addNewTask(String taskContent) {
    var uuid = const Uuid();
    var task = {} as Task;
    task.id = uuid.v1();
    task.taskContent = taskContent;
    task.timeStamp = DateFormat('dd/MM/YYYY HH:mm').format(DateTime.now());

    _pendingTasks.add(task);
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
