import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static setPendingTasks(List<String> pendingTasks) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setStringList('pendingTasks', pendingTasks);
  }

  static setCompletedTasks(List<String> completedTasks) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setStringList('completedTasks', completedTasks);
  }

  static setBackgroundIndex(int number) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('background', number);
  }

  static Future<List<String>?> getPendingTasks() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('pendingTasks');
  }

  static Future<List<String>?> getCompletedTasks() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getStringList('completedTasks');
  }

  static Future<int?> getBackground() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt('background');
  }
}
