import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static SharedPreferences? _preferences;

  static const _keyPendingTasks = 'pendingTasks';
  static const _keyCompletedTasks = 'completedTasks';
  static const _keyBackground = 'background';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setPendingTasks(String pendingTasks) async =>
      await _preferences?.setString(_keyPendingTasks, pendingTasks);

  static Future setCompletedTasks(String completedTasks) async =>
      await _preferences?.setString(_keyCompletedTasks, completedTasks);

  static Future setBackgroundIndex(int number) async =>
      await _preferences?.setString(_keyBackground, number.toString());

  static String getPendingTasks() =>
      _preferences?.getString(_keyPendingTasks) ?? '[]';

  static String getCompletedTasks() =>
      _preferences?.getString(_keyCompletedTasks) ?? '[]';

  static int getBackground() => _preferences!.getInt(_keyBackground) ?? 1;
}
