import 'package:flutter/material.dart';
import 'package:to_do_app/components/completed.dart';
import 'package:to_do_app/components/pending.dart';

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
  var currentBackground = 0;
  var activeTab = 1;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                const Text('Hello Drawer'),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'))
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Stack(
                alignment: AlignmentDirectional.topStart,
                fit: StackFit.expand,
                children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xFF787ff6), Color(0xFF4adede)],
                    tileMode: TileMode.clamp,
                    begin: Alignment(0.3, -1),
                    end: Alignment(-0.8, 1),
                  ))),
              activeTab == 0 ? pendingTask() : completedTask()
            ])) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
