import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/components/completed.dart';
import 'package:to_do_app/components/providers/active_tab_provider.dart';
import 'package:to_do_app/components/providers/background_provider.dart';
import 'package:to_do_app/components/providers/task_manage_provider.dart';
import 'package:to_do_app/components/shared/add_task_dialog.dart';
import 'package:to_do_app/components/shared/title_bar.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: titleBar(context.watch<ActiveTabProvider>().activeTaskTab),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      drawer: const DrawerComponent(),
      body: Stack(
          alignment: AlignmentDirectional.topStart,
          fit: StackFit.expand,
          children: [
            Container(
                padding: const EdgeInsets.only(
                    top: 52, left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg[context
                        .watch<BackgroundProvider>()
                        .currentBackgroundIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: context.watch<ActiveTabProvider>().activeTaskTab == 0
                    ? const PendingTasks()
                    : const CompletedTasks())
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
