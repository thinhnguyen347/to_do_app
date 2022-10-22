import 'package:flutter/material.dart';
import 'package:to_do_app/components/completed.dart';
import 'package:to_do_app/components/pending.dart';
import 'package:to_do_app/data/constants.dart' as constant;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  late int currentBackgroundIndex;
  late int activeTab;
  final bg = constant.wallpaper;

  @override
  void initState() {
    currentBackgroundIndex = 1;
    activeTab = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.account_balance_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
          drawer: Drawer(
            child: Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 24, right: 24, bottom: 24),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xFFd3e7ee), Color(0xFFABD1DE)],
                tileMode: TileMode.clamp,
                begin: Alignment(0.3, -1),
                end: Alignment(-0.8, 1),
              )),
              child: Column(children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => {
                    setState(() {
                      activeTab = 0;
                      Navigator.pop(context);
                    })
                  },
                  child: const Text('Pending tasks'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () => {
                    setState(() {
                      activeTab = 1;
                      Navigator.pop(context);
                    })
                  },
                  child: const Text('Completed tasks'),
                ),
                const SizedBox(height: 16),
                ListView(
                  shrinkWrap: true,
                  children: const <Widget>[
                    ExpansionTile(
                      backgroundColor: Colors.amber,
                      leading: Icon(Icons.settings),
                      title: Text('Change background image'),
                      children: <Widget>[
                        ListTile(title: Text('Title of the item')),
                        ListTile(
                          title: Text('Title of the item2'),
                        )
                      ],
                    ),
                  ],
                )
              ]),
            ),
          ),
          body: Stack(
              alignment: AlignmentDirectional.topStart,
              fit: StackFit.expand,
              children: [
                IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.account_balance_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bg[currentBackgroundIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: activeTab == 0 ? pendingTask() : completedTask())
              ]) // This trailing comma makes auto-formatting nicer for build methods
          ),
    );
  }
}
