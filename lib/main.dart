import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/add_new_task.dart';
import 'package:to_do_app/components/completed.dart';
import 'package:to_do_app/components/pending.dart';
import 'package:to_do_app/components/shared/drawer.dart';
import 'package:to_do_app/data/constants.dart' as constant;
import 'package:to_do_app/providers/active_tab_provider.dart';
import 'package:to_do_app/providers/background_provider.dart';
import 'package:to_do_app/providers/task_manage_provider.dart';
import 'package:to_do_app/utilities/app_shared_preferences.dart';

import 'components/shared/author.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BackgroundProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ActiveTabProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TasksProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My To-Do App',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bg = constant.wallpaper;
  List<Map> pendingTasks = [];
  List<Map> completedTasks = [];
  final today = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    AppSharedPreferences.getBackground().then((value) {
      context.read<BackgroundProvider>().changeBackground(value ?? 0);
    });

    getPendingTasks();
    getCompletedTasks();

    // FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    pendingTasks = context.watch<TasksProvider>().pendingTasks;
    completedTasks = context.watch<TasksProvider>().completedTasks;

    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerComponent(),
      body: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(bg[context
                      .watch<BackgroundProvider>()
                      .currentBackgroundIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showAuthorDialog(context);
                          },
                          icon: const Icon(
                            Icons.info,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadiusDirectional.circular(8)),
                      child: Text(
                          context.watch<ActiveTabProvider>().activeTaskTab == 0
                              ? 'Pending tasks'
                              : 'Completed Tasks',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 16),
                  Flexible(
                    fit: FlexFit.tight,
                    child: context.watch<ActiveTabProvider>().activeTaskTab == 0
                        ? PendingTasks(pendingTasks: pendingTasks, today: today)
                        : CompletedTasks(
                            completedTasks: completedTasks,
                          ),
                  ),
                ],
              ),
            )
          ]),
      // This trailing comma makes auto-formatting nicer for build methods
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewTask()));
        },
        backgroundColor: Colors.white54,
        child: const Icon(Icons.add),
      ),
    );
  }

  getPendingTasks() {
    late List<Map> list;

    AppSharedPreferences.getPendingTasks().then((tasks) {
      if (tasks != null) {
        list =
            tasks.map((e) => jsonDecode(e) as Map<dynamic, dynamic>).toList();

        context.read<TasksProvider>().setPending(list);
      }
    });
  }

  getCompletedTasks() {
    late List<Map> list;

    AppSharedPreferences.getCompletedTasks().then((tasks) {
      if (tasks != null) {
        list =
            tasks.map((e) => jsonDecode(e) as Map<dynamic, dynamic>).toList();
        context.read<TasksProvider>().setCompleted(list);
      }
    });
  }
}
