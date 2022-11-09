import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/completed.dart';
import 'package:to_do_app/components/providers/active_tab_provider.dart';
import 'package:to_do_app/components/providers/background_provider.dart';
import 'package:to_do_app/components/providers/task_manage_provider.dart';
import 'package:to_do_app/components/shared/new_task_dialog.dart';
import 'package:to_do_app/data/constants.dart' as constant;

import 'components/pending.dart';
import 'components/shared/drawer.dart';

void main() {
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
      title: 'Thinh To-Do',
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
  final TextEditingController _textFieldController = TextEditingController();
  late String valueText;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerComponent(),
      body: Stack(
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
            Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                        onPressed: () {},
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
                        color: Colors.black26,
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
                      ? const PendingTasks()
                      : const CompletedTasks(),
                ),
              ],
            )
          ]),
      // This trailing comma makes auto-formatting nicer for build methods
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _textFieldController.clear();
          _displayTextInputDialog(context);
        },
        backgroundColor: Colors.white54,
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return NewTaskDialog(controller: _textFieldController);
        });
  }
}
