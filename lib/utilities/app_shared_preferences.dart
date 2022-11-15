import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static SharedPreferences? _preferences;

  static const _keyPendingTasks = 'pendingTasks';
  static const _keyCompletedTasks = 'completedTasks';
  static const _keyBackground = 'background';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setPendingTasks(List<String> pendingTasks) async =>
      await _preferences?.setStringList(_keyPendingTasks, pendingTasks);

  static Future setCompletedTasks(List<String> completedTasks) async =>
      await _preferences?.setStringList(_keyCompletedTasks, completedTasks);

  static Future setBackgroundIndex(int number) async =>
      await _preferences?.setString(_keyBackground, number.toString());

  static List<String>? getPendingTasks() =>
      _preferences?.getStringList(_keyPendingTasks);

  static List<String>? getCompletedTasks() =>
      _preferences?.getStringList(_keyCompletedTasks);

  static int getBackground() => _preferences!.getInt(_keyBackground) ?? 1;
}
