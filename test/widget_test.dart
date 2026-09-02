import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/components/pending.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/providers/active_tab_provider.dart';
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/language_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';

void main() {
  Widget buildTestApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BackgroundProvider()),
        ChangeNotifierProvider(create: (_) => ActiveTabProvider()),
        ChangeNotifierProvider(create: (_) => TasksProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    );
  }

  testWidgets('starts on the splash screen', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(buildTestApp());

    expect(find.byType(FlashScreen), findsOneWidget);
  });

  testWidgets('navigates from splash screen to pending tasks',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(buildTestApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Pending tasks'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  test('identifies future due dates as not late', () {
    const pendingTasks = PendingTasks(pendingTasks: [], today: '02-09-2026');

    expect(pendingTasks.updateNotiImage('02-09-2026', '03-09-2026'), '');
  });

  test('identifies past due dates as late', () {
    const pendingTasks = PendingTasks(pendingTasks: [], today: '02-09-2026');

    expect(pendingTasks.updateNotiImage('02-09-2026', '01-09-2026'), 'late');
  });
}
